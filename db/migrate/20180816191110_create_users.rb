# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :phone, :null => false
      t.string :name

      t.timestamps
    end

    add_index :users, :phone, :unique => true
  end
end
