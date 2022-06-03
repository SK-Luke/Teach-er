class UsersController < ApplicationController
  before_action :select_user, only: %i[show]

  def index
    @users = User.all
    @avgRating = avgRating(@users)
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    @user_bookings_added = []
    # This section is for the calendar view
    start_date = params.fetch(:start_date, Date.today).to_date
    #@availability_slot = Availability.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @availability_slot = Availability.where(start_time: start_date.beginning_of_week..start_date.end_of_week).where(user_id: @user.id)
  end

  private

  def select_user
    @user = User.find(params[:id])
  end

  #Calculates rating for the stars
  def avgRating(users)
    sum_reviews = 0
    total_reviews = 0

    users.each do |user|
      user.reviews.each do |review|
        sum_reviews += review.rating
        total_reviews += 1
      end
    end
    (sum_reviews.to_f / total_reviews).round
  end
end
