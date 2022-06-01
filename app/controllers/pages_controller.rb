class PagesController < ApplicationController
  def home
    @users = User.all
  end

  def show
    @user = user_id()
  end

  private 
  def user_id
    @user = User.find(params[:id])
  end

  # def user_params
  #   params.require(:user).permit(:)
  # end
end
