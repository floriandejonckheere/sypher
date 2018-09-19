# frozen_string_literal: true

class MessagePolicy < ApplicationPolicy
  def create?
    # Only signed in users can create
    !user.nil?
  end

  def show?
    # Only receiver users can show
    !user.nil? && record.channel.users.include?(user)
  end

  def update?
    # Nobody can update
    false
  end

  def destroy?
    # Nobody can destroy
    update?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
