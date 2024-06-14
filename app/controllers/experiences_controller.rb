class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show edit update destroy]
  before_action :set_itinerary, only: %i[edit update destroy]
  before_action :set_service, only: %i[edit update destroy]

  def new
    @experience = Experience.new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @service = Service.find(params[:service_id])
    @user = User.all
    authorize @experience
  end

  def create
    @experience = Experience.new(experience_params)
    itinerary = Itinerary.find(params[:itinerary_id])
    experience.itinerary = itinerary
    authorize @experience

    if @experience.save
      redirect_to user_trip_path(@experience), notice: "Service was succefully added."
    else
      render :new, status: :unprocessable_entity
    end

  end

  def show
    authorize @experience
  end

  def edit
    authorize @experience

  end

  def update
    authorize @experience
    if @experience.update(experience_params)
      redirect_to user_trip_path(@experience), notice: "Service was succefully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @experience
    @experience.destroy
    redirect_to user_trip_path, notice: "Service was succefully destroyed.", status: :see_other
  end


  private

  def experience_params
    params.require(:trip).permit(:service_id, :itinerary_id)
  end

  def set_experience
    @experience = Experience.find(params[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def set_service
    @service = Service.find(params[:service_id])
  end
end
