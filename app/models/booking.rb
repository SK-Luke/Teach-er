class Booking < ApplicationRecord
  has_many :subjects
  belongs_to :user, through: :subjects

  validates :start_datetime, :end_datetime, presence: true
end
