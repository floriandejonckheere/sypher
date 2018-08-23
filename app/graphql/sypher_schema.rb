# frozen_string_literal: true

class SypherSchema < GraphQL::Schema
  mutation Types::MutationType
  query Types::QueryType

  ##
  # Handle unauthorized errors
  #
  def self.unauthorized_object(error)
    raise GraphQL::ExecutionError, "An object of type #{error.type.graphql_name} was hidden due to authorization"
  end
end
