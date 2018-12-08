# frozen_string_literal: true

module Mutations
  class CompleteUser < BaseMutation
    null true

    ##
    # Arguments
    #
    argument :phone,
             String,
             :required => true

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
          :null => true

    ##
    # Resolver
    #
    def resolve(params)
      user = User.verified.find_by_phone params[:phone]

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
