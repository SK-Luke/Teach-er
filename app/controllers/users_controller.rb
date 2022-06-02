class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @booking = Booking.new
    # This section is for the calendar view
    start_date = params.fetch(:start_date, Date.today).to_date
    #@availability_slot = Availability.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    @availability_slot = Availability.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
  end
end
