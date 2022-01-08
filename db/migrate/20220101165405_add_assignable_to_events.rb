class AddAssignableToEvents < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :events, :assignable, polymorphic: true, index: {algorithm: :concurrently}
  end
end
