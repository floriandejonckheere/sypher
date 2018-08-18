# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Membership do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Test variables
  #
  let(:membership) { build :membership }
  ##
  # Subject
  #
  subject { membership }

  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.not_to allow_value(nil).for :admin }
    it { is_expected.not_to allow_value('').for :admin }

    it 'is valid with all attributes' do
      expect(build :membership).to be_valid
    end

    it 'is invalid without admin' do
      expect(build :membership, :admin => nil).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :group }
  end
end
