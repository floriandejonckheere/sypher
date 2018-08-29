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
  # Test variables
  #
  let(:conversation) { build :conversation }

  ##
  # Subject
  #
  subject { conversation }

  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to allow_value('whatever').for :name }
    it { is_expected.to allow_value(nil).for :name }
    it { is_expected.to allow_value('').for :name }

    it { is_expected.to validate_presence_of :type }
    it { is_expected.to allow_value('Conversation').for :type }
    it { is_expected.to allow_value('Conversation').for :type }
  end

  describe 'associations' do
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:memberships) }

    describe 'maximum members' do
      describe 'no members' do
        it { is_expected.not_to be_valid }
      end

      describe 'one member' do
        before { conversation.memberships << build(:membership, :channel => conversation) }

        it { is_expected.not_to be_valid }
      end

      describe 'two members' do
        before do
          conversation.memberships << build_list(:membership, 2, :channel => conversation)
          conversation.save
        end

        it { is_expected.to be_valid }
      end

      describe 'three members' do
        before { conversation.memberships << build_list(:membership, 3, :channel => conversation) }

        it { is_expected.not_to be_valid }
      end
    end
  end
end
