class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.references :listing, foreign_key: true
      t.integer :renter_id
      t.timestamps
    end
  end
end
