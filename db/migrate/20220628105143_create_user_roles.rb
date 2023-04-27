class CreateUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.integer :role
      t.string :rtype

      t.timestamps
    end
  end
end
