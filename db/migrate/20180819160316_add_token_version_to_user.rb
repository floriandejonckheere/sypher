# frozen_string_literal: true

class AddTokenVersionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token_version, :integer, :null => false, :default => 1
  end
end
