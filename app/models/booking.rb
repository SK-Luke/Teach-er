class Booking < ApplicationRecord
  belongs_to :subject
  belongs_to :user

  STATUS = %w[pending confirmed cancelled completed]
  validates :start_time, :end_time, presence: true
  validates :status, inclusion: { in: STATUS }
end
