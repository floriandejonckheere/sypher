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
  # Subject
  #
  subject(:policy) { described_class.new user, record }

  ##
  # Test variables
  #
  let(:user) { build :user }
  let(:record) { build :user }

  ##
  # Tests
  #
  context 'when there is no user' do
    let(:user) { nil }

    it { is_expected.to permit_action :create }
    it { is_expected.to forbid_actions %i[show update destroy] }
  end

  context 'when there is a user' do
    it { is_expected.to permit_actions %i[create show] }

    context 'when the record is itself' do
      let(:user) { record }

      it { is_expected.to permit_actions %i[update destroy] }
    end

    context 'when the record is another user' do
      it { is_expected.to forbid_actions %i[update destroy] }
    end
  end
end
