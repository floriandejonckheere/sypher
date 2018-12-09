# frozen_string_literal: true

module Mutations
  class CompleteUser < BaseMutation
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
          :null => true

    ##
    # Authorization
    #
    def ready?(**args)
      # TODO: extract into concern
      if Pundit.policy!(context[:current_user], :mutation).complete_user?
        true
      else
        [false, {
          :user => nil,
          :errors => [I18n.t('pundit.unauthorized')]
        }]
      end
    end

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
