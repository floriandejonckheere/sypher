# frozen_string_literal: true

class AllowNullForUsersName < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :name, :string, :null => true, :default => nil
  end
end
