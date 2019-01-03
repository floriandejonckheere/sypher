# frozen_string_literal: true

module Types
  class ChannelType < Types::BaseObject
    ##
    # Fields
    #
    field :uuid,
          String,
          :null => false

    field :type,
          String,
          :null => false

    field :name,
          String,
          :null => true

    field :topic,
          String,
          :null => true

    field :users,
          [UserType],
          :null => false

    ##
    # Field methods
    #
    def type
      object.type.downcase
    end

    ##
    # Authorization
    #
    def self.authorized?(record, context)
      Pundit.policy!(context[:current_user], record).show?
    end
  end
end
