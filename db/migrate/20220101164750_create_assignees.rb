class CreateAssignees < ActiveRecord::Migration[6.1]
  def change
    create_table :assignees do |t|
      t.references :assignable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
