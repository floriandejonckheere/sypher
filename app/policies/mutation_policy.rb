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

  def delete_user?
    # Only signed in users can delete user
    !user.nil?
  end

  def set_privacy?
    # Only signed in users can set privacy
    !user.nil?
  end

  def update_user?
    # Only signed in users can update user
    !user.nil?
  end

  def add_contact?
    # Only signed in users can add contact
    !user.nil?
  end
end
