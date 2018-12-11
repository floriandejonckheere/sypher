# frozen_string_literal: true

module Mutations
  class SetPrivacy < BaseMutation
    include Authorizable

    null true

    ##
    # Arguments
    #
    argument :seen_scope,
             String,
             :required => true

    argument :read_scope,
             String,
             :required => true

    ##
    # Fields
    #
    field :errors,
          [String],
          :null => false

    ##
    # Resolver
    #
    def resolve(params)
      user = context[:current_user]

      if user.update params
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
