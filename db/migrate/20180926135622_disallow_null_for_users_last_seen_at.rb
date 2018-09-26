# frozen_string_literal: true

class DisallowNullForUsersLastSeenAt < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :last_seen_at, :datetime, :null => false
  end
end
