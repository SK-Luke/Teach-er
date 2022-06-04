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
    @new_availability = Availability.new
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.end_time = booking_params["start_time"].to_datetime + 1.hour

    # TODO: Add method to update availability of the teacher to be a blocker
    if @booking.save
      # 1) get teacher through subject
      teacher_id = Subject.find(@booking.subject_id).user_id
      teacher = User.find(teacher_id)
      # 2) find the availability which was selected
      availability = teacher.availabilities.where(start_time: booking_params["start_time"])[0]
      # 3) change to blocker
      if availability.nil?
        flash[:notice] = 'That slot is not available'
        redirect_to user_path(teacher_id)
      end
      availability.blocker = true
      availability.save!

      redirect_to confirmation_booking_path(@booking)
    else
      start_date = params.fetch(:start_date, Date.today).to_date
      @availability_slot = Availability.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
      @schedule = Schedule.new
      @user = User.find(params[:user_id])
      render 'users/show'
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
    params.permit(:commit)
    @booking.update(status: "confirmed") if params[:commit] == "Accept"
    @booking.update(status: "cancelled") if params[:commit] == "Decline"

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
