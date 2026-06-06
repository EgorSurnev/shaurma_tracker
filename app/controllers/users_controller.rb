class UsersController < ApplicationController
  before_action :authenticate_user! 

  def show
    @user = current_user 
    @reviews = @user.reviews.includes(:place) 
  end

  private
  
  def set_user
    @user = User.find(params[:id])
  end
end