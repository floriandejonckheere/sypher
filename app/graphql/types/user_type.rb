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
          :null => false

    field :messages,
          [MessageType],
          :null => true

    ##
    # Authorization
    #
    def self.authorized?(record, context)
      Pundit.policy!(context[:current_user], record).show?
    end
  end
end
