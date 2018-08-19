# frozen_string_literal: true

require 'types/mutation_type'

class SypherSchema < GraphQL::Schema
  mutation Types::MutationType
  query Types::QueryType
end
