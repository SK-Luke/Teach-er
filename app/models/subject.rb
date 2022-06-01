class Subject < ApplicationRecord
  belongs_to :user
  belongs_to :booking

  GRADES = %w[Secondary-1 Secondary-2 Secondary-3 Secondary-4/5]
  validates :title, :hourly_rate, :grade, presence: true
  validates :grade, inclusion: { in: GRADES }
end
