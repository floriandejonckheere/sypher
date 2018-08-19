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
      User.find_by :phone => args[:phone]
    end
  end
end