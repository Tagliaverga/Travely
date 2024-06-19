class ProfilesController < ApplicationController
  def new
    @profile = current_user
    authorize @profile
  end

  def create
    @profile = current_user
    if @profile.update(user_params)
      redirect_to root_path
    else
      render :new
    end
    authorize @profile
  end

  def update
    if current_user.update(user_params)
      UpdateUserJob.perform_later(current_user)  # <- The job is queued
      flash[:notice] = "Your profile has been updated"
      redirect_to root_path
    else
      render :edit
    end
    authorize @profile

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :city, :country, :photo)
  end

end
