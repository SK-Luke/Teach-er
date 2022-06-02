class UsersController < ApplicationController
  def show
    # raise
    @user = User.find(params[:id])
  end
end
