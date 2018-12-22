# frozen_string_literal: true

module Mutations
  class UpdateUser < BaseMutation
    include Authorizable

    null true

    ##
    # Arguments
    #
    argument :name,
             String,
             :required => true

    ##
    # Fields
    #
    field :user,
          Types::UserType,
          :null => true

    field :errors,
          [String],
          :null => false

    ##
    # Resolver
    #
    def resolve(params)
      user = context[:current_user]

      if user.update params.except(:phone)
        {
          :user => user,
          :errors => []
        }
      else
        {
          :user => nil,
          :errors => user.errors.full_messages
        }
      end
    end
  end
end
