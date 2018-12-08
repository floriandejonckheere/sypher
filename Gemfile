# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Validate phone numbers
gem 'phony_rails'
# GraphQL API
gem 'graphql'
# JWT as authentication mechanism
gem 'jwt-auth'
# Pundit as authorization mechanism
gem 'pundit'

# Use CoffeeScript for .coffee assets and views
# gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
# gem 'bootsnap', '>= 1.1.0', :require => false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', :platforms => %i[mri mingw x64_mingw]

  # Enforce code style using Rubocop
  gem 'rubocop', :require => false
  gem 'rubocop-rspec', :require => false

  # Check for vulnerable versions of gems
  gem 'bundler-audit', :require => false

  # Detect code smells
  gem 'reek', :require => false

  # BDD testing for Ruby
  gem 'rspec'
  gem 'rspec-rails'

  # Coverage report
  gem 'coveralls', :require => false
  gem 'simplecov', :require => false

  # Rails RSpec matchers
  gem 'shoulda-matchers', :git => 'https://github.com/thoughtbot/shoulda-matchers.git', :branch => 'rails-5'

  # Pundit RSpec matchers
  gem 'pundit-matchers'

  # Factory pattern for testing
  gem 'factory_bot'
  gem 'factory_bot_rails'

  # Fake data generator
  gem 'faker'

  # Reset database
  gem 'database_cleaner'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'

  # Git pre-commit hooks
  gem 'overcommit', :require => false

  # Analyze potential speed improvements
  gem 'fasterer', :require => false

  # Security vulnerability scanner
  gem 'brakeman', :require => false

  # GraphQL
  gem 'graphiql-rails'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', :platforms => %i[mingw mswin x64_mingw jruby]
