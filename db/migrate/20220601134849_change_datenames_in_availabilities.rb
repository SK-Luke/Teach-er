class ChangeDatenamesInAvailabilities < ActiveRecord::Migration[6.1]
  def change
    rename_column :availabilities, :start_datetime, :start_time
    rename_column :availabilities, :end_datetime, :end_time
  end
end
