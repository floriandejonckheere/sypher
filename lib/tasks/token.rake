# frozen_string_literal: true

namespace :token do
  desc 'Generate an authentication token that can be used in HTTP requests to the API'
  task :generate, [:id] => :environment do |_, args|
    abort 'User ID expected' unless args[:id]

    user = User.find Integer args[:id]

    token = JWT::Auth::Token.new
    token.subject = user
    token.issued_at = 1.second.ago.to_i

    puts "Bearer #{token.to_jwt}"
  end
end
