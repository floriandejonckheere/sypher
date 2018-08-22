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
      Pundit.policy(record, context[:current_user]).show?
    end
  end
end
