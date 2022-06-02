class Schedule < ApplicationRecord
  belongs_to :user

  def week
    { Monday: [mon_start_time, mon_end_time],
      Tuesday: [tues_start_time, tues_end_time],
      Wednesday: [wed_start_time, wed_end_time],
      Thursday: [thur_start_time, thur_end_time],
      Friday: [fri_start_time, fri_end_time],
      Saturday: [sat_start_time, sat_end_time],
      Sunday: [sun_start_time, sun_end_time] }
  end

  def self.week
    # { Monday: [ :mon_start_time, :mon_end_time ],
    # Tuesday: [ :tues_start_time, :tues_end_time ],
    # Wednesday: [ :wed_start_time, :wed_end_time ],
    # Thursday: [ :thur_start_time, :thur_end_time ],
    # Friday: [ :fri_start_time, :fri_end_time ],
    # Saturday: [ :sat_start_time, :sat_end_time ],
    # Sunday: [ :sun_start_time, :sun_end_time ] }
    { Monday: %i[mon_start_time mon_end_time],
      Tuesday: %i[tues_start_time tues_end_time],
      Wednesday: %i[wed_start_time wed_end_time],
      Thursday: %i[thur_start_time thur_end_time],
      Friday: %i[fri_start_time fri_end_time],
      Saturday: %i[sat_start_time sat_end_time],
      Sunday: %i[sun_start_time sun_end_time] }
  end
end
