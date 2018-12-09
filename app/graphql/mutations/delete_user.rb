# frozen_string_literal: true

module Mutations
  class DeleteUser < BaseMutation
    include Authorizable

    null true

    ##
    # Arguments
    #
    ##
    # Fields
    #
    field :errors,
          [String],
          :null => false

    ##
    # Resolver
    #
    def resolve
      user = context[:current_user]

      if user.destroy
        {
          :errors => []
        }
      else
        {
          :errors => user.errors.full_messages
        }
      end
    end
  end
end
