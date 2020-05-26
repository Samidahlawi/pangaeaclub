class RemoveColumnFromTrip < ActiveRecord::Migration[6.0]
  def change
    remove_column :trips, :bg_image
    remove_column :trips, :image

  end
end
