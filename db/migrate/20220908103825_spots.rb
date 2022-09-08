class Spots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :name, null: false
      t.string :address, null: false
      t.text :caption, null: false
      t.integer :star
      t.timestamps null: false
    end
  end
end
