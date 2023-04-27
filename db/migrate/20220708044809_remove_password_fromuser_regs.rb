class RemovePasswordFromuserRegs < ActiveRecord::Migration[7.0]
  def change
    remove_column :user_regs, :password, :string
  end
end
