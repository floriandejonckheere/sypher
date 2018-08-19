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
  # Test variables
  #
  let(:message) { build :message }

  ##
  # Subject
  #
  subject { message }

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

    it 'is invalid when sender is the same as receiver' do
      user = build :user
      expect(build :message, :sender => user, :receiver => user).not_to be_valid
    end
  end

  describe 'associations' do
    it { is_expected.to belong_to :sender }
    it { is_expected.to belong_to :receiver }
  end
end
