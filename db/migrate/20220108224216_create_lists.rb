# frozen_string_literal: true

class CreateLists < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    create_table :lists do |t|
      t.string :description
      t.references :assignable, polymorphic: true, index: { algorithm: :concurrently }
      t.timestamps
    end
  end
end
