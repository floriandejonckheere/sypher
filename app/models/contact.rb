# frozen_string_literal: true

##
# Contact
#
class Contact < ApplicationRecord
  ##
  # Properties
  #

  ##
  # Associations
  #
  belongs_to :user

  belongs_to :contact,
             :foreign_key => :contact_user_id,
             :class_name => 'User'

  ##
  # Validations
  #
  validates :contact,
            :uniqueness => { :scope => :user_id }

  validate :user_does_not_equal_contact

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
  def user_does_not_equal_contact
    errors.add :contact, :cannot_be_the_same if user == contact
  end
end
