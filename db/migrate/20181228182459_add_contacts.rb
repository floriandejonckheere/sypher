# frozen_string_literal: true

class AddContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts, :force => true, :id => false do |t|
      t.integer :user_id, :null => false
      t.integer :contact_id, :null => false
    end

    add_index :contacts, :user_id
    add_index :contacts, :contact_id

    add_index :contacts, %i[user_id contact_id], :unique => true
  end
end
