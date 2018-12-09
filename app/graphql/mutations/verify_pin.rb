# frozen_string_literal: true

module Mutations
  ##
  # Verify a PIN number
  #
  # Verify a phone number and the PIN it was sent
  #
  class VerifyPIN < BaseMutation
    include Authorizable

    null true

    ##
    # Arguments
    #
    argument :phone,
             String,
             :required => true

    argument :pin,
             Int,
             :required => true

    ##
    # Fields
    #
    field :token,
          String,
          :null => true

    field :errors,
          [String],
          :null => false

    ##
    # Resolver
    #
    def resolve(params)
      user = User.find_by_phone(params[:phone]) || User.new

      if user.verify_with_pin params[:pin]
        {
          :user => user,
          :errors => [],
          :token => JWT::Auth::Token.from_user(user).to_jwt
        }
      else
        {
          :user => nil,
          :errors => user.errors.full_messages,
          :token => nil
        }
      end
    end
  end
end
