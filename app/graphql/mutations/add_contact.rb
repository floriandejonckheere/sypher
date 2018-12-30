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
      contact = User.verified.find_by_phone! params[:phone]

      if user.contacts << contact
        {
          :phone => contact.phone,
          :errors => []
        }
      else
        {
          :phone => nil,
          :errors => user.errors.full_messages
        }
      end
    rescue ActiveRecord::RecordNotFound
      context[:current_user].errors.add :contacts, :required

      {
        :phone => nil,
        :errors => context[:current_user].errors.full_messages
      }
    rescue ActiveRecord::RecordNotUnique
      context[:current_user].errors.add :contacts, :taken

      {
        :phone => nil,
        :errors => context[:current_user].errors.full_messages
      }
    end
  end
end
