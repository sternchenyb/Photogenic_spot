class Favorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :spot_id
      t.timestamps null: false
    end
  end
end
