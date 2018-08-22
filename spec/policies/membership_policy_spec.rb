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
  # Test variables
  #
  let(:user) { build :user }
  let(:record) { build :membership }

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
    context 'member of the group' do
      context 'admins' do
        before { create :membership, :user => user, :group => record.group, :admin => true }

        it { is_expected.to permit_actions %i[create show update destroy] }
      end

      context 'non-admins' do
        before { create :membership, :user => user, :group => record.group, :admin => false }

        it { is_expected.to permit_action :show }
        it { is_expected.to forbid_actions %i[create update destroy] }
      end
    end

    context 'non-members of the group' do
      it { is_expected.to forbid_actions %i[create show update destroy] }
    end
  end
end
