# frozen_string_literal: true

##
# User account
#
class User < ApplicationRecord
  ##
  # Properties
  #
  property :phone
  property :name

  ##
  # Associations
  #
  ##
  # Validations
  #
  validates :phone,
            :presence => true

  validates :name,
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
