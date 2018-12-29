# frozen_string_literal: true

require 'rails_helper'

describe MutationPolicy do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Subject
  #
  subject(:policy) { described_class.new user, :mutation }

  ##
  # Test variables
  #
  let(:user) { build :user }

  ##
  # Tests
  #
  context 'when there is no user' do
    let(:user) { nil }

    it { is_expected.to permit_actions %i[verify_phone verify_pin] }
    it { is_expected.to forbid_actions %i[complete_user delete_user set_privacy update_user add_contact delete_contact] }
  end

  context 'when there is a user' do
    it { is_expected.to permit_actions %i[verify_phone verify_pin complete_user delete_user set_privacy update_user add_contact delete_contact] }
  end
end
