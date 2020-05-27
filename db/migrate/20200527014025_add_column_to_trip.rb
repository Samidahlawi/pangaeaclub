class AddColumnToTrip < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :status, :boolean,default: false
  end
end
