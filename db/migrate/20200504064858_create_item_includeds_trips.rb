class CreateItemIncludedsTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :item_includeds_trips do |t|
      t.references :item_included, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
    end
  end
end
