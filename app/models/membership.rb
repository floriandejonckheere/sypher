# frozen_string_literal: true

##
# User account
#
class Membership < ApplicationRecord
  ##
  # Properties
  #
  property :admin,
           :type => Boolean

  ##
  # Associations
  #
  belongs_to :user
  belongs_to :group

  ##
  # Validations
  #
  validates :admin,
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
