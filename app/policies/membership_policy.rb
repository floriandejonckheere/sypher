# frozen_string_literal: true

class MembershipPolicy < ApplicationPolicy
  def create?
    # Users can only create updatable records
    update?
  end

  def show?
    # Only members can show
    !user.nil? && record.group.memberships.where(:user => user).any?
  end

  def update?
    # Only admin members can update
    !user.nil? && record.group.memberships.where(:user => user, :admin => true).any?
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
