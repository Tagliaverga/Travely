class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update]



  def show
    authorize @user
  end


  def edit
    authorize @user
  end

  def update
    @user.update(user_params)
    redirect_to @user
    authorize @user
  end



  private


  def user_params
    params.require(:user).permit( :first_name, :last_name, :email, :password, :country, :contractor, :city)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
