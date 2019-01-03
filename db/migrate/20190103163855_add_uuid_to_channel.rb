# frozen_string_literal: true

class AddUuidToChannel < ActiveRecord::Migration[5.2]
  def change
    add_column :channels, :uuid, :string
  end
end
