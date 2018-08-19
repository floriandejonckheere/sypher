# frozen_string_literal: true

class SypherSchema < GraphQL::Schema
  mutation Types::MutationType
  query Types::QueryType
end
