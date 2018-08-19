# frozen_string_literal: true

class AddPhoneVerificationToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :verified_at, :datetime
    add_column :users, :pin, :integer
    add_column :users, :pin_sent_at, :datetime

    add_index :users, :pin
  end
end
