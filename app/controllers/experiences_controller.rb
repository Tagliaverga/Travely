class ExperiencesController < ApplicationController
  before_action :set_experience, only: %i[show edit update destroy]
  before_action :set_itinerary, only: %i[new create edit update destroy]
  before_action :set_service, only: %i[edit update destroy]
  # @trip = Trip.find(params[:trip_id])

  def new
    @experience = Experience.new
    @services = Service.all
    @users = User.all
    authorize @experience

  end

  def create
    # @user = User.find(params[:user_id])
    @experience = Experience.new(experience_params)
    @experience.itinerary = @itinerary

    authorize @experience
    if @experience.save
      redirect_to trip_path(@itinerary.trip), notice: "Service was succefully added."
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
      redirect_to trip_path(@experience), notice: "Service was succefully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @experience
    @experience.destroy
    redirect_to trip_path, notice: "Service was succefully destroyed.", status: :see_other
  end


  private

  def experience_params
    params.require(:experience).permit(:service_id, :itinerary_id)
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
