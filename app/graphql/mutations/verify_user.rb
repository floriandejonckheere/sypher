# frozen_string_literal: true

module Mutations
  class VerifyUser < BaseMutation
    null true

    ##
    # Arguments
    #
    argument :phone,
             String,
             :required => true

    argument :pin,
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
      user = User.find_by_phone params[:phone]

      if user.verify_with_pin params[:pin]
        {
          :user => user,
          :errors => []
        }
      else
        {
          :user => user,
          :errors => user.errors.full_messages
        }
      end
    end
  end
end
