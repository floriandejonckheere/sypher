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

    it { is_expected.to allow_value(nil).for :pin }
    it { is_expected.not_to allow_value(0).for :pin }
    it { is_expected.not_to allow_value(38_493).for :pin }
    it { is_expected.to allow_value(294_432).for :pin }

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
    it { is_expected.to have_many(:groups).through(:memberships) }
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
      describe 'expired pin' do
        let(:user) { create :user, :pin_sent_at => 1.day.ago }

        it 'returns false' do
          expect(user).not_to be_verified
          expect(user.verify).to eq false
          expect(user).not_to be_verified
        end
      end

      describe 'valid pin' do
        describe 'unverified user' do
          let(:user) { create :user, :pin_sent_at => 1.minute.ago }

          it 'returns true and verifies the user' do
            expect(user).not_to be_verified
            expect(user.verify).to eq true
            expect(user).to be_verified
          end
        end

        describe 'verified user' do
          let(:user) { create :user, :verified, :pin_sent_at => 1.minute.ago }

          it 'returns false' do
            expect(user).to be_verified
            expect(user.verify).to eq false
            expect(user).to be_verified
          end
        end
      end
    end

    describe '#verify_with_pin' do
      before { user.send_verification_pin }

      it 'returns false on invalid pin' do
        expect(user.verify_with_pin(123_456)).to eq false
        expect(user).not_to be_verified
      end

      it 'returns true on invalid pin' do
        expect(user.verify_with_pin(user.pin)).to eq true
        expect(user).to be_verified
      end
    end

    describe '#send_verification_pin' do
      it 'sets pin and pin_sent_at on the user' do
        expect(user.pin).to be_nil
        expect(user.pin_sent_at).to be_nil

        user.send_verification_pin

        expect(user.pin).not_to be_nil
        expect(user.pin_sent_at).not_to be_nil
      end
    end
  end
end
