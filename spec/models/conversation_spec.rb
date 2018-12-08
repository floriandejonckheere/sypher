# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Conversation do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Subject
  #
  subject(:conversation) { create :conversation }

  ##
  # Test variables
  #
  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to allow_value('whatever').for :name }
    it { is_expected.to allow_value(nil).for :name }
    it { is_expected.to allow_value('').for :name }

    it { is_expected.to validate_presence_of :type }
    it { is_expected.to allow_value('Conversation').for :type }
  end

  describe 'associations' do
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:memberships) }

    describe 'maximum members' do
      context 'when there are no members' do
        before { conversation.memberships.clear }

        it { is_expected.not_to be_valid }
      end

      context 'when there is one member' do
        before { conversation.users = [build(:user)] }

        it { is_expected.not_to be_valid }
      end

      context 'when there are two members' do
        before { conversation.users = build_list(:user, 2) }

        it { is_expected.to be_valid }
      end

      context 'when there are three members' do
        before { conversation.memberships << build_list(:membership, 3, :channel => conversation) }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
