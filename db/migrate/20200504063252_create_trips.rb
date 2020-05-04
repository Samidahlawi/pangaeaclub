class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title,null: false
      t.string :sub_title,null: false
      t.string :trip_type,null: false
      t.string :country,null: false
      t.string :destination,null: false
      t.date :deadline,null: false
      t.string :level,null: false
      t.string :bg_image,null: false
      t.integer :group_size_start
      t.integer :group_size_end,null: false
      t.integer :duration,null: false
      t.string :image
      t.date :start_date,null: false
      t.date :end_date,null: false
      t.text :description,null: false
      t.float :price,null: false
      t.references :guide, null: false, foreign_key: true
      t.references :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
