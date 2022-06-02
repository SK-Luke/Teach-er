class AddSubjectToBooking < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :subject, null: false, foreign_key: true
  end
end
