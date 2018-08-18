# frozen_string_literal: true

##
# Group chat
#
class Group < ApplicationRecord
  ##
  # Properties
  #
  property :name

  ##
  # Associations
  #
  has_many :memberships,
           :dependent => :destroy

  has_many :users,
           :through => :memberships

  ##
  # Validations
  #
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
