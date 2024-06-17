class DocumentsController < ApplicationController
  def index
    @document = Document.all
    @itinerary = Itinerary.find(params[:itinerary_id])
    authorize @document
    authorize @itinerary
  end

  def new
    @document = Document.new
    authorize @document
  end

end
