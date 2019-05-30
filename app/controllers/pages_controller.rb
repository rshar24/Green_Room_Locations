class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @locations = policy_scope(Location)
    @bookings_made = policy_scope(Booking)
    @bookings_rec = BookingPolicy::Scope.new(current_user, Booking).bookings_received
  end
end
