class ListingsController < ApplicationController
  def search
  end

  def new
    @listing = Listing.new()
  end

  def create
    # a = Listing.new(@listing, renter_id: current_user.id)

  end
end
