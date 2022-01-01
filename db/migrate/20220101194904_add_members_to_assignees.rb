class AddMembersToAssignees < ActiveRecord::Migration[6.1]
  disable_ddl_transaction!

  def change
    add_reference :assignees, :member, index: {algorithm: :concurrently}
  end
end
