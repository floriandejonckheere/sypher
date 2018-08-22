# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include JWT::Auth::Authentication
  include Pundit

  protect_from_forgery
end
