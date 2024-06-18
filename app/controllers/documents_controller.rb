class DocumentsController < ApplicationController
  before_action :set_itinerary, only: %i[index new create]
  def index
    @documents  = policy_scope(Document).where(itinerary: @itinerary)
  end

  def new
    @document = Document.new
    authorize @document
  end

  def show
    @document = Document.find(params[:id])
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    @document.itinerary = @itinerary
    if @document.save
      redirect_to @document, notice: "document created"
    else
      render :new, status: :unprocessable_entity
    end
    authorize @document
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def document_params
    params.require(:document).permit(:description, :price, :photo, :itinerary_id)
  end

end
