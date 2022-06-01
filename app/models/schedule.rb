class Schedule < ApplicationRecord
  has_many :availabilities
  belongs_to :user, through: :availabilities
end