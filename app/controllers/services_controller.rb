class ServicesController < ApplicationController
  before_action :set_user
  def new
    @service = Service.new
    authorize @service
    authorize @user
  end

  def create
    @service = Service.new(service_params)
    @service.user = @user
    if @service.save
      redirect_to @user, notice: "Service created"
    else
      render :new, status: :unprocessable_entity
    end
    authorize @service
  end

  def edit
    authorize @service
  end

  def update
    authorize @service
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to @user, notice: "Service created"
    authorize @service
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def service_params
    params.require(:service).permit(:description, :price, :local)
  end

end
