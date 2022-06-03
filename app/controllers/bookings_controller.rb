class BookingsController < ApplicationController
  before_action :select_booking, only: %i[show edit update destroy]

  # For students, push booking into user.bookings (stored as array)
  # Example for bookOne as a booking, to store for students,
  # user.bookings << booking
  # For teachers, just assign booking.user = Teachers
  # So for teachers, bookOne.user = teacher/user
  def index
    @bookings = []
    all = Booking.all
    all.each do |booking|
      @bookings << booking if current_user.subject_ids.include? booking.subject.id
    end
  end

  def show
  end

  def create
    @user = current_user
    @subject = booking_params[:subject]
    @start_time = booking_params[:subject]

    # to be added by Wan Xin
    # @end_time =
    # @grade =

    # @booking = Booking.create()
    redirect_to confirmation_bookings_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path(@booking)
  end

  def edit
    @bookings = Booking.all
  end

  def update
    @booking.update(booking_params)
    redirect_to bookings_path(@booking)
  end

  private

  def select_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:subject, :start_time)
  end

end
