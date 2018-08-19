# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    ##
    # Root-level mutations
    #
    field :create_user,
          :mutation => Mutations::CreateUser

    field :verify_user,
          :mutation => Mutations::VerifyUser

    field :request_verify_user,
          :mutation => Mutations::RequestVerifyUser
  end
end
