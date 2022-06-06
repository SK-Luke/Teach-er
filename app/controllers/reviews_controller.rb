class ReviewsController < ApplicationController
  def create
    @user = Restaurant.find(params[:user_id])
    @review = Review.new(review_params)
    @review.restaurant = @user
    if @review.save
      redirect_to user_path(@user, anchor: "review-#{@review.id}")
    else
      render 'users/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
