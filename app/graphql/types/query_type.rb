# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    ##
    # Root-level fields
    #
    field :user, UserType, :null => true do
      argument :phone,
               String,
               :required => true
    end

    field :sync, SyncType, :null => true

    field :channel, ChannelType, :null => true do
      argument :uuid,
               String,
               :required => true
    end

    field :message, MessageType, :null => true do
      argument :uuid,
               String,
               :required => true
    end

    ##
    # Field methods
    #
    def user(args)
      User.verified.find_by_phone args[:phone]
    end

    def sync
      context[:current_user]
    end

    def channel(args)
      Channel.find_by :uuid => args[:uuid]
    end

    def message(args)
      Message.find_by :uuid => args[:uuid]
    end
  end
end
