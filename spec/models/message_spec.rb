# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Subject
  #
  subject(:message) { build :message }

  ##
  # Test variables
  #
  ##
  # Tests
  #
  describe 'attributes' do
    it { is_expected.to validate_presence_of :text }
    it { is_expected.not_to allow_value(nil).for :text }
    it { is_expected.not_to allow_value('').for :text }

    it { is_expected.to validate_presence_of :uuid }
    it { is_expected.not_to allow_value(nil).for :uuid }
    it { is_expected.not_to allow_value('').for :uuid }
    it { is_expected.to allow_value('7e28b8c7-6311-46e9-b83e-f0a782cf73be').for :uuid }

    it 'is valid with all attributes' do
      expect(build :message).to be_valid
    end

    it 'is invalid without text' do
      expect(build :message, :text => nil).not_to be_valid
    end

    it 'is invalid without user' do
      expect(build :message, :user => nil).not_to be_valid
    end

    it 'is invalid without channel' do
      expect(build :message, :channel => nil).not_to be_valid
    end

    describe 'has a default uuid' do
      let(:message) { create :message }

      it { is_expected.to have_attribute :uuid }
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to :channel }
  end
end
