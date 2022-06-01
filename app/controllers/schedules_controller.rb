class SchedulesController < ApplicationController
  # before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.all
  end

  # def create
  #   @schedule = schedule.new(schedule_params)
  #   if @schedule.save
  #     redirect_to schedule_path(@schedule)
  #   else
  #     render :new
  #   end
  # end

  # def new
  #   @schedule = schedule.new
  # end

  # def edit
  # end

  # def show
  #   @review = Review.new
  # end

  # def update
  #   @schedule.update(schedule_params)
  # end

  # def destroy
  #   @schedule.destroy
  #   redirect_to schedules_path
  # end

  # def reviews
  #   @review = @schedule.reviews
  # end

  # private

  # def schedule_params
  #   params.require(:schedule).permit(:name, :address, :phone_number, :category, :id)
  # end

  # def set_schedule
  #   @schedule = schedule.find(params[:id])
  # end
end
