# frozen_string_literal: true

Rails.application.configure do
  ##
  # Interval where a user can verify the phone number using the PIN after creating an account
  #
  config.pin_expiration_period = 1.hour
end
