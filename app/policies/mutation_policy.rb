# frozen_string_literal: true

class MutationPolicy < ApplicationPolicy
  def verify_phone?
    # Everyone can verify phone
    true
  end

  def verify_pin?
    # Everyone can verify PIN
    true
  end

  def complete_user?
    # Only signed in users can complete user
    !user.nil?
  end

  class Scope < ApplicationPolicy::Scope
    def resolve
      scope.all
    end
  end
end
