# frozen_string_literal: true

class CreateMemberships < ActiveRecord::Migration[5.2]
  def change
    create_table :memberships do |t|
      t.boolean :admin, :null => false, :default => false

      t.references :user
      t.references :group

      t.timestamps
    end
  end
end
