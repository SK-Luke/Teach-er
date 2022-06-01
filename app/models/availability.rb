class Availability < ApplicationRecord
  belongs_to :user

  validates :start_datetime, :end_datetime, presence: true
end
