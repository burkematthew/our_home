# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.text :description
      t.date :due_date
      t.integer :priority
      t.timestamps
    end

    add_index :tasks, :due_date
  end
end
