class CreateItemNotIncludeds < ActiveRecord::Migration[6.0]
  def change
    create_table :item_not_includeds do |t|
      t.string :item
      t.text :description,  null: false

      t.timestamps
    end
  end
end
