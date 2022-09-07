class AddSpotImageToSpots < ActiveRecord::Migration[6.1]
  def change
    add_column :spots, :spot_image, :text
  end
end
