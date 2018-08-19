# frozen_string_literal: true

class AddUuidOnMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :uuid, :string, :null => false, :default => ''

    add_index :messages, :uuid, :unique => true
  end
end
