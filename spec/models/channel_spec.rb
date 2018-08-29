# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Channel do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Test variables
  #
  let(:channel) { build :channel }

  ##
  # Subject
  #
  subject { channel }

  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to allow_value('whatever').for :topic }
    it { is_expected.to allow_value(nil).for :topic }
    it { is_expected.to allow_value('').for :topic }

    it { is_expected.to validate_presence_of :type }
    it { is_expected.to allow_value('Conversation').for :type }
    it { is_expected.to allow_value('Group').for :type }
  end

  describe 'associations' do
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:memberships) }

    describe 'minimum members' do
      describe 'no members' do
        it { is_expected.not_to be_valid }
      end

      describe 'one member' do
        before { channel.memberships << build(:membership, :channel => channel) }

        it { is_expected.not_to be_valid }
      end

      describe 'two members' do
        before do
          channel.memberships << build_list(:membership, 2, :channel => channel)
          channel.save
        end

        it { is_expected.to be_valid }
      end

      describe 'three members' do
        before do
          channel.memberships << build_list(:membership, 3, :channel => channel)
          channel.save
        end

        it { is_expected.to be_valid }
      end
    end
  end
end
