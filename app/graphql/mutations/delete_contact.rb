# frozen_string_literal: true

module Mutations
  class DeleteContact < BaseMutation
    include Authorizable

    null true

    ##
    # Arguments
    #
    argument :phone,
             String,
             :required => true

    ##
    # Fields
    #
    field :phone,
          String,
          :null => true

    field :errors,
          [String],
          :null => false

    ##
    # Resolver
    #
    def resolve(params)
      contact = User.find_by_phone(params[:phone])

      if context[:current_user].contacts.delete contact
        {
          :phone => contact.phone,
          :errors => []
        }
      else
        {
          :phone => nil,
          :errors => contact.errors.full_messages
        }
      end
    end
  end
end
