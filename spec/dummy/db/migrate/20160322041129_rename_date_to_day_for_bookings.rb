class RenameDateToDayForBookings < ActiveRecord::Migration
  def change
  	rename_column :bookings, :date, :day
  end
end
