# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Test variables
  #
  let(:group) { build :group }

  ##
  # Subject
  #
  subject { group }

  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to allow_value('whatever').for :name }
    it { is_expected.to allow_value(nil).for :name }
    it { is_expected.to allow_value('').for :name }
    it { is_expected.to validate_length_of(:name).is_at_most(20) }

    it { is_expected.to allow_value('12345678901234567890').for :name }
    it { is_expected.not_to allow_value('123456789012345678901').for :name }

    it { is_expected.to validate_presence_of :type }
    it { is_expected.to allow_value('Conversation').for :type }
    it { is_expected.to allow_value('Group').for :type }
  end

  describe 'associations' do
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:memberships) }

    describe 'maximum members' do
      describe 'no members' do
        it { is_expected.not_to be_valid }
      end

      describe 'one member' do
        before { group.memberships << build(:membership, :channel => group) }

        it { is_expected.not_to be_valid }
      end

      describe 'two members' do
        before do
          group.memberships << build_list(:membership, 2, :channel => group)
          group.save
        end

        it { is_expected.to be_valid }
      end

      describe 'three members' do
        before do
          group.memberships << build_list(:membership, 3, :channel => group)
          group.save
        end

        it { is_expected.to be_valid }
      end
    end
  end
end
