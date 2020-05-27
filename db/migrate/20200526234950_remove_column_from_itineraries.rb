class RemoveColumnFromItineraries < ActiveRecord::Migration[6.0]
  def change
    remove_column :itineraries, :image

  end
end
