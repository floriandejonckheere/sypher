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
    # Authorization
    #
    def self.authorized?(record, context)
      # For an unknown reason this method sometimes gets called with a result hash
      return true if record.is_a? Hash

      record ||= User.new
      Pundit.policy!(context[:current_user], record).create?
    end

    ##
    # Resolver
    #
    def resolve(params)
      user = User.new params
      if user.save
        user.send_verification_pin
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
