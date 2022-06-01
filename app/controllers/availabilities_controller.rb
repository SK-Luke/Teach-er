class AvailabilitiesController < ApplicationController
  # before_action :set_availability, only: [:show, :edit, :update, :destroy]

  # def index
  #   @availability = Availability.all
  # end

  # def create
  #   @availability = availability.new(availability_params)
  #   if @availability.save
  #     redirect_to availability_path(@availability)
  #   else
  #     render :new
  #   end
  # end

  def new
    @availability = availability.new
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

  # private

  # def availability_params
  #   params.require(:availability).permit(:name, :address, :phone_number, :category, :id)
  # end

  # def set_availability
  #   @availability = availability.find(params[:id])
  # end
end
