# frozen_string_literal: true

class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.integer :month
      t.string :description
      t.integer :cash_flow_type
      t.decimal :amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
