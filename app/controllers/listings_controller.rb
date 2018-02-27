class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :destroy]

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.renter_id = current_user.id
    if @listing.save!
      redirect_to listing_path(@listing)
    else
      render:new
    end
    authorize @listing
  end


  def search
    # add active/inactive boolean check
    if params[:term]
      @listings = Listing.where('address ILIKE ?', "%#{params[:term]}%").all
    else
      @listings = Listing.all
    end
    authorize @listings
  end

  def show
  end

  def my_listings
    @user = current_user
    authorize @user.listings
  end

  def destroy
    @listing.destroy
    redirect_to my_listings_path
  end

  def edit
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def update
    @listing = Listing.find(params[:id])
    @listing = Listing.update(listing_params)
    authorize @listing
  end

  private

  def set_listing
    @listing = Listing.find(params[:id])
    authorize @listing
  end

  def listing_params
    params.require(:listing).permit(:address, :bike_type, :renter_id, :active, :instruction, :hourly_price, :listing_name, :description, :term, :photo)
  end

end
