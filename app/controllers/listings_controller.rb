class ListingsController < ApplicationController
  def search
    # @listings = if params[:term]
    #   Listing.where('address ILIKE ?', "%#{params[:term]}%").all
    # else
    #   Listing.all
    # end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.renter_id = current_user.id
    if @listing.save!
      redirect_to listing_path(@listing)
    else
      render:new
    end
  end

  private

  def listing_params
    params.require(:listing).permit(:address, :bike_type, :renter_id, :active, :instruction, :hourly_price, :listing_name, :description)
  end
end
