class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # raise
    @subjects = "#{@user.subjects.first.title} | #{@user.subjects.first.grade}"
    @availabilities = "From: #{@user.availabilities.first.start_time} to #{@user.availabilities.first.end_time}"
    @booking = Booking.new
  end
end
