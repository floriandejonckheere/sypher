# frozen_string_literal: true

JWT::Auth.configure do |config|
  ##
  # Token lifetime
  #
  config.token_lifetime = 48.hours

  ##
  # JWT secret
  #
  config.secret = Rails.application.secrets.secret_key_base
end