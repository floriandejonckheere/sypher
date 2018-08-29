# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Test variables
  #
  let(:user) { create :user }

  ##
  # Subject
  #
  subject { user }

  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.not_to allow_value(nil).for :name }
    it { is_expected.not_to allow_value('').for :name }

    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_uniqueness_of(:phone).case_insensitive }
    it { is_expected.not_to allow_value(nil).for :phone }
    it { is_expected.not_to allow_value('').for :phone }
    it { is_expected.not_to allow_value(0).for :phone }

    it { is_expected.to allow_value('0032494456789').for :phone }
    it { is_expected.to allow_value('032494456789').for :phone }
    it { is_expected.to allow_value('+32494456789').for :phone }
    it { is_expected.to allow_value('494456789').for :phone }

    it { is_expected.to allow_value(nil).for :last_seen_at }
    it { is_expected.to allow_value(Time.now).for :last_seen_at }

    it { is_expected.to allow_value(nil).for :pin }
    it { is_expected.not_to allow_value(0).for :pin }
    it { is_expected.not_to allow_value(38_493).for :pin }
    it { is_expected.to allow_value(294_432).for :pin }

    it { is_expected.to allow_value(:nobody).for :read_scope }
    it { is_expected.to allow_value(:contacts).for :read_scope }
    it 'raises ArgumentError on invalid read_scope values' do
      expect { subject.read_scope = :everyone }.to raise_error ArgumentError
    end

    it { is_expected.to allow_value(:nobody).for :seen_scope }
    it { is_expected.to allow_value(:contacts).for :seen_scope }
    it { is_expected.to allow_value(:everyone).for :seen_scope }
    it 'raises ArgumentError on invalid read_scope values' do
      expect { subject.seen_scope = :foobar }.to raise_error ArgumentError
    end

    describe 'has a default last_seen_at' do
      let(:user) { create :user }

      it { is_expected.to have_attributes :last_seen_at => subject.created_at }
    end

    describe 'has a default read scope' do
      let(:user) { create :user }

      # Reload user from database to ensure default values are set
      before { user.reload }

      it { is_expected.to have_attributes :read_scope => 'contacts' }
    end

    describe 'has a default seen scope' do
      let(:user) { create :user }

      # Reload user from database to ensure default values are set
      before { user.reload }

      it { is_expected.to have_attributes :seen_scope => 'everyone' }
    end

    describe 'has a default country code' do
      let(:user) { create :user, :phone => '494456789' }

      it { is_expected.to have_attributes :phone => '+32494456789' }
    end

    describe 'unique over phone number' do
      before(:each) { create :user }
      let(:user) { build :user, :phone => User.first.phone }

      it { is_expected.not_to be_valid }
    end

    it 'is valid with all attributes' do
      expect(build :user).to be_valid
    end

    it 'is invalid without phone' do
      expect(build :user, :phone => nil).not_to be_valid
    end

    it 'is invalid without name' do
      expect(build :user, :name => nil).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:messages).dependent(:destroy) }
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:channels).through(:memberships) }
  end

  describe 'scopes' do
    describe 'verified' do
      before do
        create :user
        create :user, :verified
      end

      it 'returns only users with a verified_at timestamp' do
        expect(User.count).to eq 2
        expect(User.verified.count).to eq 1
      end
    end
  end

  describe 'methods' do
    describe '#find_by_phone' do
      let(:user) { create :user, :phone => '+32474123456' }

      # Make sure the user is created
      before { user }

      it 'normalizes phone number' do
        expect(User.find_by_phone '0032474123456').to eq user
        expect(User.find_by_phone '474123456').to eq user
      end

      describe '#verified?' do
        describe 'unverified user' do
          it { is_expected.not_to be_verified }
        end

        describe 'verified user' do
          let(:user) { create :user, :verified }

          it { is_expected.to be_verified }
        end
      end
    end

    describe '#verify' do
      let(:user) { create :user, :verified_at => nil }

      it 'sets verified_at' do
        user.verify
        expect(user).to be_valid
        expect(user.verified_at).not_to be nil
      end
    end

    describe '#verify_with_pin' do
      describe 'invalid pin' do
        let(:user) { create :user, :pin => 123_456 }

        it 'returns false' do
          expect(user).not_to be_verified
          expect(user.verify_with_pin 654_321).to eq false
          expect(user).not_to be_verified
        end
      end

      describe 'expired pin' do
        let(:user) { create :user, :pin => 123_456, :pin_sent_at => 1.day.ago }

        it 'returns false' do
          expect(user).not_to be_verified
          expect(user.verify_with_pin user.pin).to eq false
          expect(user).not_to be_verified
        end
      end

      describe 'valid pin' do
        describe 'unverified user' do
          let(:user) { create :user, :pin => 123_456, :pin_sent_at => 1.minute.ago }

          it 'returns true and verifies the user' do
            expect(user).not_to be_verified
            expect(user.verify_with_pin user.pin).to eq true
            expect(user).to be_verified
          end
        end

        describe 'verified user' do
          let(:user) { create :user, :verified, :pin => 123_456, :pin_sent_at => 1.minute.ago }

          it 'returns false' do
            expect(user).to be_verified
            expect(user.verify_with_pin user.pin).to eq false
            expect(user).to be_verified
          end
        end
      end
    end

    describe '#send_verification_pin' do
      describe 'unverified user' do
        it 'sets pin and pin_sent_at on the user' do
          expect(user.pin).to be_nil
          expect(user.pin_sent_at).to be_nil

          user.send_verification_pin

          expect(user.pin).not_to be_nil
          expect(user.pin_sent_at).not_to be_nil
        end
      end

      describe 'verified user' do
        let(:user) { create :user, :verified, :pin => 123_456, :pin_sent_at => 2.months.ago }

        it 'return false' do
          expect(user.pin).not_to be_nil
          expect(user.pin_sent_at).not_to be_nil

          expect(user.send_verification_pin).to eq false

          expect(user.pin).not_to be_nil
          expect(user.pin_sent_at).not_to be_nil
        end
      end
    end
  end
end
