class ListingsController < ApplicationController

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


  def index
    # add active/inactive boolean check
    @listings = if params[:term]
      Listing.where('address ILIKE ?', "%#{params[:term]}%").all
    else
      Listing.all
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def my_listings
    @user = current_user
  end

  private

  def listing_params
    params.require(:listing).permit(:address, :bike_type, :renter_id, :active, :instruction, :hourly_price, :listing_name, :description, :term, :photo)
  end

end
