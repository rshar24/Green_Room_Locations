class LocationsController < ApplicationController
  def index
    @locations = Location.all

    @locations = Location.where.not(latitude: nil, longitude: nil)

    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { location: location }),

      }
    end
  end

  def show
    @location = Location.find(params[:id])
    @booking = Booking.new
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

  def update
    @location = Location.find(params[:id])
    @location.update(location_params)
    if @location.save
      redirect_to location_path(@location)
    else
      render :edit
    end
  end

  private

  def set_locations
    @locations = Locations.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :price, :description, :cover)
  end
end
