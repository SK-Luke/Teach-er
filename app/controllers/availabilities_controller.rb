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

  def show
    @availability = Availability.find(params[:id])
    @hash = @availability.json
  end

  # def update
  #   @availability = availability.find(params[:id])
  #   @availability.update(availability_params)
  # end

  def destroy
    @availability = Availability.find(params[:id])
    @availability.destroy
    respond_to do |format|
      @availability_slot = Availability.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
      format.js { render inline: "location.reload();" }
      #format.html { render 'schedules/index' }
      #format.json # Follow the classic Rails flow and look for a create.json view
    end
  end

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
