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
end

  private

  def select_user
    @user = User.find(params[:id])
  end

  #Calculates rating for the stars
  def avgRating(users)
    # Iterate through each review and get its rating 
    users.each do |user|
      count = 0
      # Sum of reviews
      user.reviews.each do |review|
        count += review.rating
      end
    totalReview = user.reviews.count
    avg = (count.to_f / totalReview.to_f).round
    return avg
  end
  # Count total reviews
end
