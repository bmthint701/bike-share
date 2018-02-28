class BookingsController < ApplicationController
  def review
    @listing = Listing.find(params[:listing_id])
    authorize @listing
  end
end
