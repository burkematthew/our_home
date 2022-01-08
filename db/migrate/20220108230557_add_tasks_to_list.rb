# frozen_string_literal: true

class AddTasksToList < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :tasks, :list, index: { algorithm: :concurrently }
  end
end
