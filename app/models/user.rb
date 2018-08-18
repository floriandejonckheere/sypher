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

  ##
  # Associations
  #
  has_many :messages,
           :dependent => :destroy,
           :inverse_of => :receiver

  has_many :memberships

  has_many :groups,
           :through => :memberships

  ##
  # Validations
  #
  phony_normalize :phone,
                  :default_country_code => 'BE'

  validates :phone,
            :presence => true,
            :phony_plausible => true

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
