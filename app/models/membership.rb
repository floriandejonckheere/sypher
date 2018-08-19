# frozen_string_literal: true

##
# User account
#
class Membership < ApplicationRecord
  ##
  # Properties
  #
  property :admin

  ##
  # Associations
  #
  belongs_to :user
  belongs_to :group

  ##
  # Validations
  #
  validates :admin,
            :inclusion => { :in => [true, false] }

  ##
  # Scopes
  #
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
