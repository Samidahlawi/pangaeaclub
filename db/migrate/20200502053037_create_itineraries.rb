class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string :title
      t.string :name, null: false
      t.text :description, null: false
      t.string :image

      t.timestamps
    end
  end
end
