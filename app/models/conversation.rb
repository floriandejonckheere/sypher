# frozen_string_literal: true

##
# Conversation
#
class Conversation < Channel
  ##
  # Properties
  #
  ##
  # Associations
  #
  ##
  # Validations
  #
  validate :maximum_members

  ##
  # Scopes
  #
  ##
  # Callbacks
  #
  ##
  # Class methods
  #
  ##
  # Instance methods
  #
  ##
  # Overrides
  #
  ##
  # Helpers and callback methods
  #
  def maximum_members
    return if memberships.size <= 2

    errors.add :memberships, :maximum_members
  end
end
