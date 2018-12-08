# frozen_string_literal: true

require 'rails_helper'

describe MembershipPolicy do
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
  let(:record) { create :membership }

  ##
  # Tests
  #
  context 'when there is no user' do
    let(:user) { nil }

    it { is_expected.to forbid_actions %i[create show update destroy] }
  end

  context 'when there is a user' do
    context 'when the user is a member of the group' do
      context 'when the user is an admin' do
        before { create :membership, :user => user, :channel => record.channel, :admin => true }

        it { is_expected.to permit_actions %i[create show update destroy] }
      end

      context 'when the user is not an admin' do
        before { create :membership, :user => user, :channel => record.channel, :admin => false }

        it { is_expected.to permit_action :show }
        it { is_expected.to forbid_actions %i[create update destroy] }
      end
    end

    context 'when the user is not a member of the group' do
      it { is_expected.to forbid_actions %i[create show update destroy] }
    end
  end
end
