class ReviewsController < ApplicationController
  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    authorize @review
    if @booking.review
      redirect_to locations_path
    else
      @review.booking = @booking
      @review.location = @booking.location
      if @review.save
        redirect_to dashboard_path
      else
        render :new
      end
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
