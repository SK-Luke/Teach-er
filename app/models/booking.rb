class Booking < ApplicationRecord
  has_one :subject
  belongs_to :user

  validates :start_time, :end_time, presence: true
end
