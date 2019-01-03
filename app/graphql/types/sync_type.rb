# frozen_string_literal: true

module Types
  class SyncType < Types::BaseObject
    ##
    # Fields
    #
    field :phone,
          String,
          :null => false

    field :name,
          String,
          :null => true

    field :contacts,
          [UserType],
          :null => false

    field :channels,
          [ChannelType],
          :null => false

    field :read_scope,
          String,
          :null => true

    field :seen_scope,
          String,
          :null => true

    ##
    # Field methods
    #
    ##
    # Authorization
    #
    def self.authorized?(record, context)
      Pundit.policy!(context[:current_user], record).show?
    end
  end
end
