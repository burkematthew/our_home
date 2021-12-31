class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :event_type, index: true, foreign_key: true
      t.timestamps
    end

    add_index :events, :starts_at
  end
end
