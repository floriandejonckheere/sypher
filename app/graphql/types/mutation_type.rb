# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    ##
    # Root-level mutations
    #
    field :create_user,
          :mutation => Mutations::CreateUser

    ##
    # Mutation methods
    #
  end
end
