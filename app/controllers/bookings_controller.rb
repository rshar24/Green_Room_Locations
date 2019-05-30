class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @location = Location.find(params[:location_id])
    @booking.location = @location
    @booking.user = current_user
    if @booking.save
      redirect_to location_path(@location)
    else
      render template: "locations/show"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:entry_date, :exit_date)
  end
end
