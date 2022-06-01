class RemoveBookingFromSubjects < ActiveRecord::Migration[6.1]
  def change
    remove_reference :subjects, :booking, null: false, foreign_key: true
  end
end
