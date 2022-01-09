# frozen_string_literal: true

class AddBudgetCategoryToBudget < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :budgets, :budget_category, index: { algorithm: :concurrently }
  end
end
