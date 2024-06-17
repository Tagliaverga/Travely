class ItinerariesController < ApplicationController
  before_action :set_trip, only: %i[show new create]

  def new
    @itinerary = Itinerary.new
    authorize @itinerary
    authorize @trip
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.trip = @trip
    if @itinerary.save
      redirect_to trip_path(@trip), notice: "itinerario salvo"
    else
      render :new, status: :unprocessable_entity
    end
    authorize @itinerary
  end

  def show
    authorize @itinerary
  end


  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy
    redirect_to trip_path(params[:trip]), notice: "itinerary deleted"
    authorize @itinerary
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def itinerary_params
    params.require(:itinerary).permit(:description, :date)
  end

end
