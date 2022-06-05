class AvailabilitiesController < ApplicationController
  # before_action :set_availability, only: [:show, :edit, :update, :destroy]

  # def index
  #   @availability = Availability.all
  # end

  def create
    @new_availability = Availability.new(availability_params)
    @new_availability.user = current_user

    if @new_availability.save
      schedule = Schedule.last
      @new_availability.split(schedule.week)
      redirect_to '/schedules'
    else
      start_date = params.fetch(:start_date, Date.today).to_date
      @availability_slot = Availability.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
      @schedule = Schedule.new
      render 'schedules/index'
    end
  end

  # def edit
  # end

  # def show
  #   @review = Review.new
  # end

  # def update
  #   @availability = availability.find(params[:id])
  #   @availability.update(availability_params)
  # end

  # def destroy
  #   @availability.destroy
  #   redirect_to availabilitys_path
  # end

  # def reviews
  #   @review = @availability.reviews
  # end

  private

  def availability_params
    params.require(:availability).permit(:start_time, :end_time)
  end

  # def set_availability
  #   @availability = availability.find(params[:id])
  # end
end
