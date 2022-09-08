class Comments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :spot_id
      t.text :comment, null: false
      t.timestamps null: false
    end
  end
end
