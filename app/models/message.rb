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
  belongs_to :sender,
             :class_name => 'User'

  belongs_to :receiver,
             :class_name => 'User'

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
  after_initialize :generate_uuid

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
  def generate_uuid
    self.uuid = SecureRandom.uuid
  end
end
