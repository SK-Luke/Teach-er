class Subject < ApplicationRecord
  belongs_to :user
  has_many :bookings

  SUBJECTS = %w[A.Math E.Math English Chinese Malay Tamil Geography History Social_Studies Physics Biology Chemistry]
  GRADES = %w[Secondary-1 Secondary-2 Secondary-3 Secondary-4/5]
  # GRADES = [['Secondary-1', 'Secondary-1'] ,['Secondary-2', 'Secondary-2'],['Secondary-3', 'Secondary-3'],['Secondary-4/5', 'Secondary-4/5']]
  validates :title, :hourly_rate, :grade, presence: true
  validates :grade, inclusion: { in: GRADES }
  validates :title, inclusion: { in: SUBJECTS }
end
