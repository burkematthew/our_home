# frozen_string_literal: true

class CreateBudgetCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :budget_categories do |t|
      t.string :description
      t.timestamps
    end
  end
end
