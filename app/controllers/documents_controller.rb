class DocumentsController < ApplicationController
  before_action :set_itinerary, only: %i[show new create]
  def index
    @documents = policy_scope(Document)
    @document  = Document.where(params[:id])
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)
    @document.itinerary = @itinerary
    if @document.save
      redirect_to itinerary_documents_path(@itinerary), notice: "document created"
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
