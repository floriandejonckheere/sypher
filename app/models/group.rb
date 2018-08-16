# frozen_string_literal: true

##
# User account
#
class Group < ApplicationRecord
  ##
  # Properties
  #
  property :name

  ##
  # Associations
  #
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
