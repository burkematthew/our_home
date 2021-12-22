class CreateMembers < ActiveRecord::Migration[6.1]
  def change
    create_table :members do |t|
      t.text :first_name
      t.text :middle_name
      t.text :last_name
      t.date :birthdate
      t.timestamps
    end
  end
end
