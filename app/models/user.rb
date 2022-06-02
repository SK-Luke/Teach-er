class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :availabilities, dependent: :destroy
  has_many :bookings
  has_one :schedule, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ROLES = %w[Teacher Student]
  validates :email, :username, presence: true
  validates :role, inclusion: { in: ROLES }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def student?
    self.role == "Student"
  end

  def teacher?
    self.role == "teacher"
  end
end
