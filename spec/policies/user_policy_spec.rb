# frozen_string_literal: true

require 'rails_helper'

describe UserPolicy do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Test variables
  #
  let(:user) { build :user }
  let(:record) { build :user }

  ##
  # Subject
  #
  subject { described_class.new user, record }

  ##
  # Tests
  #
  context 'signed out user' do
    let(:user) { nil }

    it { is_expected.to forbid_action :show }
  end

  context 'signed in user' do
    it { is_expected.to permit_action :show }
  end
end
