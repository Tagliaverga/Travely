class ItinerariesController < ApplicationController
  before_action :set_trip, only: %i[new create destroy]
  def new
    @trip = Trip.find(params[:trip_id])
    @itinerary = Itinerary.new
    authorize @itinerary
    authorize @trip
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.trip = @trip
    if @itinerary.save
      redirect_to user_trip_path(current_user, @trip), notice: "itinerario salvo"
      else
        render :new, status: :unprocessable_entity
    end
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
