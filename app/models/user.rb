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

  # Phone verification PIN
  property :pin

  ##
  # Associations
  #
  has_many :messages,
           :dependent => :destroy,
           :foreign_key => 'receiver_id'

  has_many :memberships,
           :dependent => :destroy

  has_many :groups,
           :through => :memberships

  ##
  # Validations
  #
  phony_normalize :phone,
                  :default_country_code => Rails.configuration.default_country_code

  validates :phone,
            :presence => true,
            :uniqueness => { :case_sensitive => false },
            :phony_plausible => true

  validates :name,
            :presence => true

  validates :pin,
            :format => {
              :allow_blank => true,
              :with => /\A[0-9]{6}\z/
            }

  ##
  # Scopes
  #
  scope :verified,
        -> { where.not(:verified_at => nil) }

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
