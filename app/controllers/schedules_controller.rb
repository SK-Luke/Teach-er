class SchedulesController < ApplicationController
  # before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def create
    @schedule = schedule.new(schedule_params)
    @schedule.user = current_user
    if @schedule.save
      redirect_to schedule_path(@schedule)
    else
      render :new
    end
  end

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

  private

  def schedule_params
    params.require(:schedule).permit(:mon_start_time, :mon_end_time, :tues_start_time, :tues_end_time, :wed_start_time, :wed_end_time, :thur_start_time, :thur_end_time, :fri_start_time, :fri_end_time, :sat_start_time, :sat_end_time, :sun_start_time, :sun_end_time)
  end

  # def set_schedule
  #   @schedule = schedule.find(params[:id])
  # end
end
