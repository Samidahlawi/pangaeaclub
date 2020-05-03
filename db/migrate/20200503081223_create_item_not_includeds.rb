class CreateItemNotIncludeds < ActiveRecord::Migration[6.0]
  def change
    create_table :item_not_includeds do |t|
      t.string :item,null: false
      t.text :description, null: false
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
