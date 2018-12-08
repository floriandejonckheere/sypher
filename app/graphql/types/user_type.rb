# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    ##
    # Fields
    #
    field :phone,
          String,
          :null => false

    field :name,
          String,
          :null => true

    ##
    # Authorization
    #
    def self.authorized?(record, context)
      # Allow showing user when signing up (technically disallowed because unauthenticated)
      return true if context.query.operation_name == 'signup'

      Pundit.policy!(context[:current_user], record).show?
    end
  end
end
