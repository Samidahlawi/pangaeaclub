class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.string :first_name,null: false
      t.string :last_name,null: false
      t.string :email,null: false
      t.string :gender,null: false
      t.references :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
