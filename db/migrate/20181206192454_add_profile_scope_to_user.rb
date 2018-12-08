# frozen_string_literal: true

class AddProfileScopeToUser < ActiveRecord::Migration[5.2]
  def change
    # Privacy settings
    add_column :users, :profile_scope, :string
  end
end
