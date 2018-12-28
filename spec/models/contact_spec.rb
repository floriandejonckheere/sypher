# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Subject
  #
  subject(:contact) { build :contact }

  ##
  # Test variables
  #
  ##
  # Tests
  #
  describe 'associations' do
    it { is_expected.to belong_to :user }
    it { is_expected.to belong_to(:contact).with_foreign_key(:contact_user_id).class_name 'User' }
    it { is_expected.to validate_uniqueness_of(:contact).scoped_to :user_id }

    context 'when user equals contact' do
      before { contact.user = contact.contact }

      it { is_expected.not_to be_valid }
    end
  end
end
