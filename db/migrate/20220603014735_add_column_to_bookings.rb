class AddColumnToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :grade, :string
  end
end
