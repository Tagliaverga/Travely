class ExperiencesController < ApplicationController

  def new
    @experience = Experience.new
  end

  def create
    @experience = Experience.new(experience_params)
    authorize @trip
    if @experience.save
      redirect_to user_trips_path(@experience), notice: "Service was succefully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # @experiences = Experience.all
    @experience = Experience.find(params[:id])
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
