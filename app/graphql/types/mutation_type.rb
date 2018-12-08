# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    ##
    # Root-level mutations
    #
    field :verify_phone,
          :mutation => Mutations::VerifyPhone

    field :verify_user,
          :mutation => Mutations::VerifyUser

    field :request_verify_user,
          :mutation => Mutations::RequestVerifyUser

    field :update_user,
          :mutation => Mutations::UpdateUser
  end
end
