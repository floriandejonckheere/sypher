# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    ##
    # Fields
    #
    field :uuid,
          String,
          :null => false

    field :text,
          String,
          :null => false

    field :timestamp,
          Integer,
          :null => false

    field :sender,
          UserType,
          :null => false

    field :channel,
          ChannelType,
          :null => false

    ##
    # Field methods
    #
    def timestamp
      object.created_at
    end

    def sender
      object.user
    end

    ##
    # Authorization
    #
    def self.authorized?(record, context)
      Pundit.policy!(context[:current_user], record).show?
    end
  end
end
