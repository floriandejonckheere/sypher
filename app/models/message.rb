# frozen_string_literal: true

##
# Message sent to user or group
#
class Message < ApplicationRecord
  ##
  # Properties
  #
  property :text
  property :uuid

  ##
  # Associations
  #
  belongs_to :user
  belongs_to :channel

  ##
  # Validations
  #
  validates :text,
            :presence => true

  validates :uuid,
            :presence => true

  ##
  # Scopes
  #
  ##
  # Callbacks
  #
  after_initialize :set_random_uuid

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
end
