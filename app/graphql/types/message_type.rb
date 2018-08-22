# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    ##
    # Fields
    #
    field :text,
          String,
          :null => false

    field :uuid,
          String,
          :null => false

    field :sender,
          UserType,
          :null => false

    field :receiver,
          UserType,
          :null => false

    ##
    # Authorization
    #
    def self.authorized?(record, context)
      Pundit.policy!(context[:current_user], record).show?
    end
  end
end
