# frozen_string_literal: true

require 'rails_helper'

describe ConversationPolicy do
  ##
  # Configuration
  #
  ##
  # Stubs and mocks
  #
  ##
  # Subject
  #
  subject(:policy_class) { described_class }

  ##
  # Test variables
  #
  ##
  # Tests
  #
  it { is_expected.to be < ChannelPolicy }
end
