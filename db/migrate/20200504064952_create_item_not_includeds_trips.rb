class CreateItemNotIncludedsTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :item_not_includeds_trips do |t|
      t.references :item_not_included, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
    end
  end
end
