# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    ##
    # Fields
    #
    field :phone,
          String,
          :null => false

    field :name,
          String,
          :null => true

    field :contacts,
          [UserType],
          :null => true

    ##
    # Field methods
    #
    def contacts
      object.contact_users if context[:current_user].phone == phone
    end

    ##
    # Authorization
    #
    def self.authorized?(record, context)
      Pundit.policy!(context[:current_user], record).show?
    end
  end
end
