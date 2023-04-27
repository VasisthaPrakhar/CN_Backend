class AddRoleIdToUser1s < ActiveRecord::Migration[7.0]
  def change
    add_reference :user1s, :user_role, null: true, foreign_key: true
  end
end
