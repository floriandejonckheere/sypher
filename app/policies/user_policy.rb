# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def show?
    # Only signed in users
    !@user.nil?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
