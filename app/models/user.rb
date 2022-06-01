class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :bookings, through: :subjects, dependent: :destroy
  has_one :schedule, through: :availabilities, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
