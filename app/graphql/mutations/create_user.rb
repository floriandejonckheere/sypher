# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
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
      user = User.new params
      if user.save
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
