class AvailabilitiesController < ApplicationController
  # before_action :set_availability, only: [:show, :edit, :update, :destroy]

  # def index
  #   @availability = Availability.all
  # end

  def create
    @availability = Availability.new(availability_params)
    @availability.user = current_user

    if @availability.save
      redirect_to '/calendar'
    else
      render 'pages/calendar'
    end
  end

  # def edit
  # end

  # def show
  #   @review = Review.new
  # end

  # def update
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
