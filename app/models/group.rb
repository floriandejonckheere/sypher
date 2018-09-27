# frozen_string_literal: true

##
# Group chat
#
class Group < Channel
  ##
  # Properties
  #
  property :name
  property :topic

  ##
  # Associations
  #
  ##
  # Validations
  #
  validates :name,
            :length => { :maximum => 20 }

  validates :topic,
            :length => { :maximum => 50 }

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
end
