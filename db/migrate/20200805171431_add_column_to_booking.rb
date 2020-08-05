class AddColumnToBooking < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :status, :boolean, null: false, default: false
  end
end
