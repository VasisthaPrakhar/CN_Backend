class CreateRegables < ActiveRecord::Migration[7.0]
  def change
    create_table :regables do |t|
      t.belongs_to :article, null: false, foreign_key: true
      t.belongs_to :user_reg, null: false, foreign_key: true

      t.timestamps
    end
  end
end
