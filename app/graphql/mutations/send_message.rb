# frozen_string_literal: true

module Mutations
  class SendMessage < BaseMutation
    null true

    ##
    # Arguments
    #
    argument :sender,
             String,
             :required => true

    argument :receiver,
             String,
             :required => true

    argument :text,
             String,
             :required => true

    ##
    # Fields
    #
    field :message,
          Types::MessageType,
          :null => true

    field :errors,
          [String],
          :null => true

    ##
    # Resolver
    #
    def resolve(params)
      message_params = {
        :sender => User.find_by_phone(params[:sender]),
        :receiver => User.find_by_phone(params[:receiver]),
        :text => params[:text]
      }
      message = Message.new message_params
      if message.save
        {
          :message => message,
          :errors => []
        }
      else
        {
          :message => nil,
          :errors => message.errors.full_messages
        }
      end
    end
  end
end
