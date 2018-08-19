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

  validate :sender_is_not_receiver

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

  def sender_is_not_receiver
    return unless sender == receiver

    errors.add :base, :sender_is_not_receiver
  end
end
