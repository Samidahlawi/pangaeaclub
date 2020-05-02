class CreateGuides < ActiveRecord::Migration[6.0]
  def change
    create_table :guides do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :country, null: false
      t.string :hobby, null: false
      t.string :instagram
      t.text :description, null: false
      t.string :profile_image, null: false
      t.string :position

      t.timestamps
    end
  end
end
