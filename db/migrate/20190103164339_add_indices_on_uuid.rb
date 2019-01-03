# frozen_string_literal: true

class AddIndicesOnUuid < ActiveRecord::Migration[5.2]
  def change
    add_index :messages, :uuid, :unique => true
    add_index :channels, :uuid, :unique => true
  end
end
