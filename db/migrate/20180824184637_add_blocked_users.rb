# frozen_string_literal: true

class AddBlockedUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :blocked, :force => true, :id => false do |t|
      t.integer :user_id, :null => false
      t.integer :blocked_user_id, :null => false
    end

    add_index :blocked, :user_id
    add_index :blocked, :blocked_user_id
  end
end
