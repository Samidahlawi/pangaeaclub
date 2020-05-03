class CreateItineraries < ActiveRecord::Migration[6.0]
  def change
    create_table :itineraries do |t|
      t.string :title,  null: false
      t.string :name,  null: false
      t.text :description,  null: false
      t.string :image
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
