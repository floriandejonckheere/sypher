# frozen_string_literal: true

class DropUserProfileScope < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :profile_scope
  end
end
