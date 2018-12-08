# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    ##
    # Root-level mutations
    #
    field :verify_phone,
          :mutation => Mutations::VerifyPhone

    field :verify_pin,
          :mutation => Mutations::VerifyPIN

    field :request_verify_user,
          :mutation => Mutations::RequestVerifyUser

    field :update_user,
          :mutation => Mutations::UpdateUser
  end
end
