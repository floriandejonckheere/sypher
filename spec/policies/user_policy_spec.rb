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
  subject { described_class.new record, user }

  ##
  # Tests
  #
  context 'signed out user' do
    let(:user) { nil }

    it { is_expected.to permit_action :create }
    it { is_expected.to forbid_actions %i[show update destroy] }
  end

  context 'signed in user' do
    it { is_expected.to permit_actions %i[create show] }

    context 'on itself' do
      let(:user) { record }

      it { is_expected.to permit_actions %i[update destroy] }
    end

    context 'on another user' do
      it { is_expected.to forbid_actions %i[update destroy] }
    end
  end
end
