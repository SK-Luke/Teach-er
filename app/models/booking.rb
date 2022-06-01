class Booking < ApplicationRecord
  has_many :subjects
  belongs_to :user, through: :subjects
end
