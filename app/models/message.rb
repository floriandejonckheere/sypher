# frozen_string_literal: true

##
# User account
#
class Message < ApplicationRecord
  ##
  # Properties
  #
  property :text

  ##
  # Associations
  #
  has_one :sender,
          :required => true,
          :class_name => 'User'

  has_one :receiver,
          :required => true,
          :class_name => 'User'

  ##
  # Validations
  #
  validates :text,
            :presence => true

  ##
  # Callbacks
  #
  ##
  # Methods
  #
  ##
  # Overrides
  #
  ##
  # Helpers and callback methods
  #
end
