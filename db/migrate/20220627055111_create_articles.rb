class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :desc
      t.string :img
      t.datetime :st_time
      t.datetime :end_time
      t.integer :fee
      t.string :venue
      t.string :etype
      t.string :tag

      t.timestamps
    end
  end
end
