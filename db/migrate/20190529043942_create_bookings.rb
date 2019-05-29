class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :location, foreign_key: true
      t.references :user, foreign_key: true
      t.date :entry_date
      t.date :exit_date
      t.integer :booking_price

      t.timestamps
    end
  end
end
