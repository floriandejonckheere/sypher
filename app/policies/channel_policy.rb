# frozen_string_literal: true

class ChannelPolicy < ApplicationPolicy
  def create?
    # Only signed in users can create
    !user.nil?
  end

  def show?
    # Only members can show
    !user.nil? && record.memberships.where(:user => user).any?
  end

  def update?
    # Only admin members can show
    !user.nil? && record.memberships.where(:user => user, :admin => true).any?
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
