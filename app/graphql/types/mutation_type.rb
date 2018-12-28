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

    field :complete_user,
          :mutation => Mutations::CompleteUser

    field :delete_user,
          :mutation => Mutations::DeleteUser

    field :set_privacy,
          :mutation => Mutations::SetPrivacy

    field :update_user,
          :mutation => Mutations::UpdateUser

    # Contacts
    field :add_contact,
          :mutation => Mutations::AddContact
  end
end
