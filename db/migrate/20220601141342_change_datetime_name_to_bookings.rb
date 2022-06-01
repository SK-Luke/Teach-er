class ChangeDatetimeNameToBookings < ActiveRecord::Migration[6.1]
  def change
    rename_column :bookings, :start_datetime, :start_time
    rename_column :bookings, :end_datetime, :end_time
  end
end
