class UsersController < ApplicationController
  before_action :select_user, only: %i[show]

  def index
    # @users = User.where(role:"Teacher")
    # I can't get ratings for each user from controller. Doing it on index.html instead. See line 27 onwards
    # @avgRating = avgRating(@users)
    @user = User.new
    filtered_results
  end

  def show
    @booking = Booking.new
    @review = Review.new
    @user_bookings_added = []
    # This section is for the calendar view
    start_date = params.fetch(:start_date, Date.today).to_date
    #@availability_slot = Availability.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @availability_slot = Availability.where(start_time: start_date.beginning_of_week.beginning_of_day..start_date.end_of_week.end_of_day).where(user_id: @user.id)

    # for review form, validate if user has had class with teacher
  end

  private

  def select_user
    @user = User.find(params[:id])
  end

  def search_params
    params.require(:search).permit(:subjects)
    params[:search][:subjects].shift
    return params[:search][:subjects]
  end

  def filtered_results
    params.permit(:subj_name)
    if params["search"].present?
      @users = []
      subj = Subject.all
      subj.each do |s|
        @users << s.user if search_params.include? s.title
      end
    else
      @users = User.all
    end
  end

  # I can't get ratings for each user from the backend. Doing it on index.html instead.
  #Calculates rating for the stars
  # def avgRating(users)
  #   sum_reviews = 0
  #   total_reviews = 0

  #   users.each do |user|
  #     user.reviews.each do |review|
  #       sum_reviews += review.rating
  #       total_reviews += 1
  #     end
  #   end
  #   (sum_reviews.to_f / total_reviews).round
  # end
end
