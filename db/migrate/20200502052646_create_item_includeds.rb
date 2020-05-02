class CreateItemIncludeds < ActiveRecord::Migration[6.0]
  def change
    create_table :item_includeds do |t|
      t.string :title
      t.text :description,  null: false

      t.timestamps
    end
  end
end
