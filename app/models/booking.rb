class Booking < ApplicationRecord
  belongs_to :subject
  # belongs_to :student, class_name: "User", foreign_key: "user_id"
  belongs_to :user

  STATUS = %w[pending confirmed cancelled completed]
  GRADES = %w[Secondary-1 Secondary-2 Secondary-3 Secondary-4/5]
  validates :start_time, :end_time, presence: true
  validates :status, inclusion: { in: STATUS }
  validates :grade, inclusion: { in: GRADES }
end
