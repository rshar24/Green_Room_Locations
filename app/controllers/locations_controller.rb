class LocationsController < ApplicationController
  def index
    @locations = Location.all

    @locations = Location.where.not(latitude: nil, longitude: nil)

    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }
    end
  end

  def show
    @location = Location.find(params[:id])
    @booking = Booking.new

     @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude
      }

  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.user = current_user

    if @location.save
      redirect_to location_path(@location)
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  private

  def set_locations
    @locations = Locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :price, :description, :cover)
  end
end
