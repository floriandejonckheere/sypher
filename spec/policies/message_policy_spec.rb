# frozen_string_literal: true

require 'rails_helper'

describe MessagePolicy do
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
  let(:record) { build :message }

  ##
  # Subject
  #
  subject { described_class.new user, record }

  ##
  # Tests
  #
  context 'signed out user' do
    let(:user) { nil }

    it { is_expected.to forbid_actions %i[create show update destroy] }
  end

  context 'signed in user' do
    it { is_expected.to permit_action :create }

    context 'sender of the message' do
      let(:user) { record.sender }

      it { is_expected.to forbid_actions %i[show update destroy] }
    end

    context 'receiver of the message' do
      let(:user) { record.receiver }

      it { is_expected.to permit_action :show }
      it { is_expected.to forbid_actions %i[update destroy] }
    end

    context 'outside user' do
      it { is_expected.to forbid_actions %i[show update destroy] }
    end
  end
end
