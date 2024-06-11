class ItinerariesController < ApplicationController
  def new
    @itinerary = Itinerary.new
    @trip = Trip.find(params[:trip_id])
    authorize @itinerary
    authorize @trip
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @trip = Trip.find(params[:trip_id])
    @itinerary.trip = @trip
    if @itinerary.save
      redirect_to @trip, notice: "itinerario salvo"
      else
        render :new, status: :unprocessable_entity
        end
        authorize @itinerary
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:description, :date)
  end

end
