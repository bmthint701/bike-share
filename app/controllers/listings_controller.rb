class ListingsController < ApplicationController
  def search
    # @listings = if params[:term]
    #   Listing.where('address ILIKE ?', "%#{params[:term]}%").all
    # else
    #   Listing.all
    # end
  end

  def new
    @listing = Listing.new()
  end

  def create
    # a = Listing.new(@listing, renter_id: current_user.id)

  end
end
