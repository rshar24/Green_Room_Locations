class ReviewsController < ApplicationController
  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.location = Location.find(params[:location_id])
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
