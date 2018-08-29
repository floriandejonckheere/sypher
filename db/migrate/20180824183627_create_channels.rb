# frozen_string_literal: true

class CreateChannels < ActiveRecord::Migration[5.2]
  def change
    create_table :channels do |t|
      # Single Table Inheritance
      t.string :type, :null => false

      # Channel details
      t.string :topic

      # Group details
      t.string :name

      t.timestamps
    end
  end
end
