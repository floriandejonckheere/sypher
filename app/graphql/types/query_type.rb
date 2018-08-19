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

    ##
    # Field methods
    #
    def user(args)
      User.verified.find_by_phone args[:phone]
    end
  end
end
