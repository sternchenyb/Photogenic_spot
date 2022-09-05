class AddImageToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :image, :text
  end
end
