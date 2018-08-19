# frozen_string_literal: true

Rails.application.routes.draw do
  ##
  # Development GraphQL
  #
  mount GraphiQL::Rails::Engine, :at => '/graphiql', :graphql_path => '/graphql' if Rails.env.development?

  ##
  # GraphQL endpoint
  #
  post '/graphql', :to => 'graphql#execute'
end
