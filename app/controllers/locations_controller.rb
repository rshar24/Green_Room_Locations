class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
    @main = @location.photos.find_by(main: true)
    @booking = Booking.new
  end

  def new
    @location = Location.new
  end

  def ceate
    @location = Location.new(location_params)
    @location.create
  end

  def edit
    @location = Location.find(params[:id])
  end

  private

  def set_locations
    @locations = Locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :price, :descripion)
  end
end
