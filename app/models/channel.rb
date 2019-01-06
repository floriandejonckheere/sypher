# frozen_string_literal: true

##
# Chat channel - this can be a group conversation or a direct message
#
class Channel < ApplicationRecord
  ##
  # Properties
  #
  property :uuid
  property :name
  property :topic

  # STI type
  property :type

  ##
  # Associations
  #
  has_many :memberships,
           :dependent => :destroy

  has_many :users,
           :class_name => 'User',
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
  after_initialize :set_random_uuid,
                   :if => :new_record?

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
  def set_random_uuid
    self.uuid = SecureRandom.uuid
  end

  def minimum_members
    return if memberships.size >= 2

    errors.add :memberships, :minimum_members
  end
end
