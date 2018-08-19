# frozen_string_literal: true

##
# Message sent to user or group
#
class Message < ApplicationRecord
  ##
  # Properties
  #
  property :text

  ##
  # Associations
  #
  belongs_to :sender,
             :class_name => 'User'

  belongs_to :receiver,
             :class_name => 'User'

  ##
  # Validations
  #
  validates :text,
            :presence => true

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
