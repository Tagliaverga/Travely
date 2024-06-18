# class TripsController < ApplicationController
#   before_action :set_trip, only:  %i[show edit update destroy]
#   before_action :set_itinerary, only: %i[edit update destroy]


#   def new
#     @trip = Trip.new
#     authorize @trip
#   end

#   def create
#     @trip = Trip.new(trip_params)
#     @trip.user = current_user
#     authorize @trip
#     if @trip.save
#       redirect_to trip_path(@trip), notice: "Trip was succefully created."
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def index
#     @trips = policy_scope(Trip)
#   end

#   def show
#     authorize @trip
#   end

#   def edit
#     authorize @trip
#   end

#   def update
#     authorize @trip
#     if @trip.update(trip_params)
#       redirect_to trips_path, notice: "Trip was succefully updated."
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @trip.destroy
#     redirect_to trips_path, notice: "Trip was succefully destroyed.", status: :see_other
#     authorize @trip
#   end

#   private

#   def trip_params
#     params.require(:trip).permit(:destination, :star_date, :end_date, :photo)
#   end

#   def set_trip
#     @trip = Trip.find(params[:id])
#   end

#   def set_itinerary
#     @itinerary = Itinerary.find(params[:id])
#   end
# end


class TripsController < ApplicationController
  before_action :set_trip, only: %i[show edit update destroy]

  def show
    authorize @trip
    @itineraries = @trip.itineraries.includes(:experiences).order(date: :asc)
  end

  def index
    @trips = policy_scope(Trip)
  end

  def destroy
    authorize @trip
    @trip.destroy
    redirect_to trips_path, notice: "Trip was successfully destroyed.", status: :see_other
  end


  private

  def trip_params
    params.require(:trip).permit(:destination, :star_date, :end_date, :photo)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end 
end
