class AddAcceptedColumnToBookings < ActiveRecord::Migration[5.1]
  def change
    add_column :bookings, :accepted, :boolean, default: nil
  end
end
