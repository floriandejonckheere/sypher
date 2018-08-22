# frozen_string_literal: true

JWT::Auth.configure do |config|
  ##
  # Token lifetime
  #
  config.token_lifetime = 1000.years

  ##
  # JWT secret
  #
  config.secret = Rails.application.secrets.secret_key_base

  ##
  # User model
  #
  config.model = User
end
