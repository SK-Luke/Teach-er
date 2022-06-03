class Booking < ApplicationRecord
  belongs_to :subject
  belongs_to :student, class_name: "User", foreign_key: "user_id"

  STATUS = %w[pending confirmed cancelled completed]
  validates :start_time, :end_time, presence: true
  validates :status, inclusion: { in: STATUS }
end
