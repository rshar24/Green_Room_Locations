class LocationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    if params[:query].present?
      sql_query = " \
        locations.name ILIKE :query \
        OR locations.address ILIKE :query \
        OR locations.description ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
      "
      @locations = Location.joins(:user).where(sql_query, query: "%#{params[:query]}%").where.not(latitude: nil, longitude: nil)
      set_markers

    else
      @locations = Location.all
      set_markers
    end
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

  def set_markers
    @markers = @locations.map do |location|
      {
        lat: location.latitude,
        lng: location.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { location: location }),
      }
    end
  end

  def set_locations
    @locations = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address, :price, :description, :cover)
  end
end
