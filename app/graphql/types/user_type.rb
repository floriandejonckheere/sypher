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
          :null => false

    field :messages,
          [MessageType],
          :null => true
  end
end
