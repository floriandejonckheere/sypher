# frozen_string_literal: true

##
# Allow specifying a user instead of a token when authenticating
#
# Instead of the token authentication header:
#
# ```
# Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9...
# ```
#
# Set the following request header:
#
# ```
# Authorization: User 1
# ```
#
# Where '1' is the unique user identifier
#
class UserAuthentication
  def initialize(app)
    @app = app
  end

  def call(env)
    if env['HTTP_AUTHORIZATION']&.starts_with? 'User'
      user = User.find env['HTTP_AUTHORIZATION']&.split(' ')&.last
      token = JWT::Auth::Token.from_user(user).to_jwt if user
      env['HTTP_AUTHORIZATION'] = "Bearer #{token}" if token
    end

    status, headers, body = @app.call env

    [status, headers, body]
  end
end
