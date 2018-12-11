# frozen_string_literal: true

class ChangeUserScopeDataTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :seen_scope, :integer
    change_column :users, :read_scope, :integer
    change_column :users, :profile_scope, :integer
  end
end
