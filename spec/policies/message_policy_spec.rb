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
  # Subject
  #
  subject(:policy) { described_class.new user, record }

  ##
  # Test variables
  #
  let(:user) { create :user }
  let(:record) { create :message }

  ##
  # Tests
  #
  context 'when there is no user' do
    let(:user) { nil }

    it { is_expected.to forbid_actions %i[create show update destroy] }
  end

  context 'when there is a user' do
    it { is_expected.to permit_action :create }

    context 'when the user is the sender of the message' do
      let(:user) { record.user }

      it { is_expected.to forbid_actions %i[show update destroy] }
    end

    context 'when the user is the receiver of the message' do
      let(:user) { record.channel.users.first }

      it { is_expected.to permit_action :show }
      it { is_expected.to forbid_actions %i[update destroy] }
    end

    context 'when the user is another user' do
      it { is_expected.to forbid_actions %i[show update destroy] }
    end
  end
end
