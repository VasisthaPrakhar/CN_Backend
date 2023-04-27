class AddPasswordToUserRegs < ActiveRecord::Migration[7.0]
  def change
    add_column :user_regs, :password, :string
  end
end
