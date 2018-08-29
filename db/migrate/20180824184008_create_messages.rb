# frozen_string_literal: true

class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      # Message details
      t.string :text
      t.string :uuid
      t.references :user
      t.references :channel

      t.timestamps
    end
  end
end
