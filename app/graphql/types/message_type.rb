# frozen_string_literal: true

module Types
  class MessageType < Types::BaseObject
    ##
    # Fields
    #
    field :text,
          String,
          :null => false

    field :sender,
          UserType,
          :null => false

    field :receiver,
          UserType,
          :null => false
  end
end
