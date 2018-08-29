# frozen_string_literal: true

##
# Chat channel - this can be a group conversation or a direct message
#
class Channel < ApplicationRecord
  ##
  # Properties
  #
  property :topic

  # STI type
  property :type

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
  validates :type,
            :presence => true

  validate :minimum_members

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
  def minimum_members
    return if memberships.size >= 2

    errors.add :memberships, :minimum_members
  end
end
