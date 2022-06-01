class Availability < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validates :start_datetime, :end_datetime, presence: true
end
