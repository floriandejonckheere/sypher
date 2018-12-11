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
  # Subject
  #
  subject(:user) { create :user }

  ##
  # Test variables
  #
  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to allow_value(nil).for :name }
    it { is_expected.to allow_value('').for :name }
    it { is_expected.to validate_length_of(:name).is_at_most(20) }

    it { is_expected.to allow_value('12345678901234567890').for :name }
    it { is_expected.not_to allow_value('123456789012345678901').for :name }

    it { is_expected.to validate_presence_of :phone }
    it { is_expected.to validate_uniqueness_of(:phone).case_insensitive }
    it { is_expected.not_to allow_value(nil).for :phone }
    it { is_expected.not_to allow_value('').for :phone }
    it { is_expected.not_to allow_value(0).for :phone }

    it { is_expected.to allow_value('0032494456789').for :phone }
    it { is_expected.to allow_value('032494456789').for :phone }
    it { is_expected.to allow_value('+32494456789').for :phone }
    it { is_expected.to allow_value('494456789').for :phone }

    it { is_expected.to allow_value(Time.now).for :last_seen_at }

    it { is_expected.to allow_value(nil).for :pin }
    it { is_expected.not_to allow_value(0).for :pin }
    it { is_expected.not_to allow_value(38_493).for :pin }
    it { is_expected.to allow_value(294_432).for :pin }

    it { is_expected.to allow_value(:nobody).for :read_scope }
    it { is_expected.to allow_value(:contacts).for :read_scope }
    it 'raises ArgumentError on invalid read_scope values' do
      expect { user.read_scope = :everyone }.to raise_error ArgumentError
    end

    it { is_expected.to allow_value(:nobody).for :seen_scope }
    it { is_expected.to allow_value(:contacts).for :seen_scope }
    it { is_expected.to allow_value(:everyone).for :seen_scope }
    it 'raises ArgumentError on invalid seen_scope values' do
      expect { user.seen_scope = :foobar }.to raise_error ArgumentError
    end

    describe 'last_seen_at' do
      let(:user) { create :user }

      it 'is not nil' do
        expect(user.last_seen_at).not_to be_nil
      end
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

    describe 'has a default profile scope' do
      let(:user) { create :user }

      # Reload user from database to ensure default values are set
      before { user.reload }

      it { is_expected.to have_attributes :profile_scope => 'everyone' }
    end

    describe 'has a default country code' do
      subject { create :user, :phone => '494456789' }

      it { is_expected.to have_attributes :phone => '+32494456789' }
    end

    describe 'unique over phone number' do
      subject { build :user, :phone => user.phone }

      it { is_expected.not_to be_valid }
    end

    it 'is valid with all attributes' do
      expect(build :user).to be_valid
    end

    it 'is invalid without phone' do
      expect(build :user, :phone => nil).not_to be_valid
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
        expect(described_class.verified.count).to eq 1
      end
    end
  end

  describe 'methods' do
    describe '#find_by_phone' do
      let(:user) { create :user, :phone => '+32474123456' }

      # Make sure the user is created
      before { user }

      it 'normalizes phone number with country code' do
        expect(described_class.find_by_phone '0032474123456').to eq user
      end

      it 'normalizes phone number without country code' do
        expect(described_class.find_by_phone '474123456').to eq user
      end

      describe '#verified?' do
        context 'when the user is unverified' do
          it { is_expected.not_to be_verified }
        end

        context 'when the user is verified' do
          let(:user) { create :user, :verified }

          it { is_expected.to be_verified }
        end
      end
    end

    describe '#verify' do
      let(:user) { create :user, :verified_at => nil, :token_version => 1 }

      before { user.verify }

      it { is_expected.to be_valid }
      it { is_expected.to be_verified }
      it { is_expected.to have_attributes :token_version => 2 }
    end

    describe '#verify_with_pin' do
      context 'when the pin is invalid' do
        let(:user) { create :user, :pin => 123_456 }

        it { is_expected.not_to be_verified }

        it 'returns false' do
          expect(user.verify_with_pin 654_321).to eq false
        end

        it 'does not verify the user' do
          user.verify_with_pin 654_321
          expect(user).not_to be_verified
        end
      end

      context 'when the pin has expired' do
        let(:user) { create :user, :pin => 123_456, :pin_sent_at => 1.day.ago }

        it { is_expected.not_to be_verified }

        it 'returns false' do
          expect(user.verify_with_pin user.pin).to eq false
        end

        it 'does not verify the user' do
          user.verify_with_pin user.pin
          expect(user).not_to be_verified
        end
      end

      context 'when the pin is valid' do
        let(:user) { create :user, :pin => 123_456, :pin_sent_at => 1.minute.ago }

        it { is_expected.not_to be_verified }

        it 'returns true' do
          expect(user.verify_with_pin user.pin).to eq true
        end

        it 'verifies the user' do
          user.verify_with_pin user.pin
          expect(user).to be_verified
        end
      end
    end

    describe '#send_verification_pin' do
      it { is_expected.to have_attributes :pin => nil, :pin_sent_at => nil }

      it 'generates a pin for the user' do
        user.send_verification_pin

        expect(user).to have_attributes :pin => a_value, :pin_sent_at => a_value
      end
    end

    describe '#touch' do
      let(:time) { 10.minutes.ago }

      before do
        user.update :updated_at => time,
                    :last_seen_at => time
      end

      it 'updates timestamps' do
        user.touch

        expect(user).not_to have_attributes :updated_at => time, :last_seen_at => time
      end
    end
  end
end
