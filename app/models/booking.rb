class Booking < ApplicationRecord
  has_one :subject
  belongs_to :user

  validates :start_datetime, :end_datetime, presence: true
end
