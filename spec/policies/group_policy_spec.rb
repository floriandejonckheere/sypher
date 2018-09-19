# frozen_string_literal: true

require 'rails_helper'

describe GroupPolicy do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Test variables
  #
  let(:user) { create :user }
  let(:record) { create :group }

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

    context 'member of the group' do
      context 'admins' do
        before { create :membership, :user => user, :channel => record, :admin => true }

        it { is_expected.to permit_actions %i[show update destroy] }
      end

      context 'non-admins' do
        before { create :membership, :user => user, :channel => record, :admin => false }

        it { is_expected.to permit_action :show }
        it { is_expected.to forbid_actions %i[update destroy] }
      end
    end

    context 'non-members of the group' do
      it { is_expected.to permit_action :create }
      it { is_expected.to forbid_actions %i[show update destroy] }
    end
  end
end
