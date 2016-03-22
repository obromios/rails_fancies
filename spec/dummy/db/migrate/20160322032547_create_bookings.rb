class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.date :date
      t.integer :slot

      t.timestamps null: false
    end
  end
end
