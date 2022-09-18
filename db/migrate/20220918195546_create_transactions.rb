# frozen_string_literal: true

class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.bigint :account_id
      t.decimal :amount, precision: 10, scale: 2
      t.date :date
      t.string :description
      t.integer :merchant_id
      t.string :labels, array: true, default: []
      t.integer :category_id
      t.string :external_id
      t.timestamps
    end

    add_index :transactions, :date
    add_index :transactions, :account_id
    add_index :transactions, :merchant_id
    add_index :transactions, :category_id
    add_index :transactions, :external_id
  end
end
