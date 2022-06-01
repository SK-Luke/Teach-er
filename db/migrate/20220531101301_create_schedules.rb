class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.time :mon_start_time
      t.time :mon_end_time
      t.time :tues_start_time
      t.time :tues_end_time
      t.time :wed_start_time
      t.time :wed_end_time
      t.time :thur_start_time
      t.time :thur_end_time
      t.time :fri_start_time
      t.time :fri_end_time
      t.time :sat_start_time
      t.time :sat_end_time
      t.time :sun_start_time
      t.time :sun_end_time

      t.timestamps
    end
  end
end
