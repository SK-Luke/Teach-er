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

    if current_user.role == "Teacher"
      all.each do |booking|
        @bookings << booking if current_user.subject_ids.include? booking.subject.id
      end
    elsif current_user.role == "Student"
      all.each do |booking|
        @bookings << booking if (current_user.id == booking.user_id)
      end
    end
  end

  def show
  end

  def create
    # @user = current_user
    # @subject = booking_params[:subject]
    # @start_time = booking_params[:start_time]
    # @grade = booking_params[:grade]
    @new_availability = Availability.new
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.end_time = booking_params["start_time"].to_datetime + 1.hour

    if @booking.save
      #@new_availability = Availability.new(availability_params)
      #redirect_to '/users/show'
      redirect_to confirmation_booking_path(@booking)
    else
      start_date = params.fetch(:start_date, Date.today).to_date
      @availability_slot = Availability.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
      @schedule = Schedule.new
      render 'schedules/index'
      # raise
    end
  end

  def confirmation
    @booking = Booking.find(params[:id])
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
    params.require(:booking).permit(:subject_id, :start_time, :grade)
  end

end
