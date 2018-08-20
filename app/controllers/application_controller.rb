# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include JWT::Auth::Authentication

  rescue_from JWT::Auth::UnauthorizedError, :with => :handle_unauthorized

  protected

  def handle_unauthorized
    head :unauthorized
  end
end
