class ReviewsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @review = Review.new(review_params)
    @booking = Booking.new
    @review.listing = @listing
    if @review.save
      redirect_to listing_path(@listing)
    else
      render 'listings/show'
      # redirect_to root_path
    end
    authorize @review
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
