# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      # Membership details
      t.boolean :admin, :null => false, :default => false
      t.string :nickname

      t.references :user
      t.references :channel

      t.timestamps
    end

    add_index :memberships, %i[user_id channel_id], :unique => true
  end
end
