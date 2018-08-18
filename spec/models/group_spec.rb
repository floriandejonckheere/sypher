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
    it { is_expected.not_to allow_value(nil).for :name }
    it { is_expected.not_to allow_value('').for :name }

    it 'is valid with all attributes' do
      expect(build :group).to be_valid
    end

    it 'is invalid without name' do
      expect(build :group, :name => nil).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:memberships).dependent(:destroy) }
    it { is_expected.to have_many(:users).through(:memberships) }
  end
end
