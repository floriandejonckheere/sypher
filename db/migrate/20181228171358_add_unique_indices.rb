# frozen_string_literal: true

class AddUniqueIndices < ActiveRecord::Migration[5.2]
  def change
    add_index :blocked, %i[user_id blocked_user_id], :unique => true
  end
end
