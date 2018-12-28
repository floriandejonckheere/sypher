# frozen_string_literal: true

module Mutations
  class AddContact < BaseMutation
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
      user = context[:current_user]
      contact_user = User.find_by_phone(params[:phone])

      contact = Contact.new :user => user,
                            :contact => contact_user

      if contact.save
        {
          :phone => contact.contact.phone,
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
