# frozen_string_literal: true

class GraphqlController < ApplicationController
  # Authenticates user from request header
  before_action :authenticate_user

  # Renew token and set response header
  after_action :renew_token

  ##
  # GraphQL endpoint
  #
  def execute
    variables = ensure_hash params[:variables]
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      # current_user: current_user,
    }
    result = SypherSchema.execute query, :variables => variables, :context => context, :operation_name => operation_name

    render :json => result
  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  ##
  # Handle form data, JSON body, or a blank value
  #
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash JSON.parse(ambiguous_param)
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  ##
  # Development logging
  #
  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render :json => { :error => { :message => e.message, :backtrace => e.backtrace }, :data => {} }, :status => 500
  end
end
