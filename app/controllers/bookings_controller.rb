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
    @booking = Booking.new
    @user = current_user
    @teacher = @subject.user

    @booking.save
    redirect_to confirmation_bookings_path(@booking)
  end

#  start_time, :end_time, :user_id, :subject_id)

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
end

# t.datetime "start_time"
# t.datetime "end_time"
# t.datetime "created_at", precision: 6, null: false
# t.datetime "updated_at", precision: 6, null: false
# t.bigint "user_id", null: false
# t.bigint "subject_id", null: false
# t.string "status", default: "pending"
# t.index ["subject_id"], name: "index_bookings_on_subject_id"
# t.index ["user_id"], name: "index_bookings_on_user_id"
