class RemoveRoleFromUser1s < ActiveRecord::Migration[7.0]
  def change
    remove_column :user1s, :role, :integer
  end
end
