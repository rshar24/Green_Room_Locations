class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    @booking = Booking.new
  end

  def new
    @location = Location.new
    authorize @location
  end

  def create
    @location = Location.new(location_params)
    authorize @location
    @location.user = current_user

    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
    authorize @location
  end

  private

  def set_locations
    @locations = Locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :price, :description, :cover)
  end
end
