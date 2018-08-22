# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def create?
    # Everyone can create users
    true
  end

  def show?
    # Only signed in users can show
    !user.nil?
  end

  def update?
    # Users can only update their own record
    !user.nil? && user == record
  end

  def destroy?
    # Users can only destroy updatable records
    update?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
