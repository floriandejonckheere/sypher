# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      # User details
      t.string :phone, :null => false, :default => ''
      t.string :name, :null => false, :default => ''
      t.datetime :last_seen_at

      # PIN verification
      t.integer :pin
      t.datetime :pin_sent_at
      t.datetime :verified_at

      # Authentication
      t.integer :token_version, :null => false, :default => 1

      # Privacy settings
      t.string :read_scope
      t.string :seen_scope

      t.timestamps
    end
  end
end
