# frozen_string_literal: true

##
# User account
#
class Membership < ApplicationRecord
  ##
  # Properties
  #
  property :admin
  property :nickname

  ##
  # Associations
  #
  belongs_to :user
  belongs_to :channel

  ##
  # Validations
  #
  validates :admin,
            :inclusion => { :in => [true, false] }

  validates_uniqueness_of :user_id,
                          :scope => :channel_id

  # TODO: validation for membership count in groups and conversations

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
end
