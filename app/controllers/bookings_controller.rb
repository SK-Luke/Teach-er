class BookingsController < ApplicationController
  before_action :select_booking, only: %i[show edit update destroy]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    redirect_to bookings_path(@booking)
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

  def subject_params
    # params[:subject][:grade].shift
    # params.require(:booking).permit(:title, :description, :hourly_rate, grade: [])
  end
end
