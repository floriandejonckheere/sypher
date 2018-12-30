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

    ##
    # Field methods
    #
    def user(args)
      User.verified.find_by_phone args[:phone]
    end

    def sync
      context[:current_user]
    end
  end
end
