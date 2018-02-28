class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :show]
  before_action :set_listing, only: [:show, :destroy, :edit, :update]

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
    if params[:term] != ""
      @listings = Listing.near(params[:term], 10)
    else
      @listings = Listing.where.not(latitude: nil, longitude: nil)
      # @listings = Listing.all
    end

    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }
    end

    authorize @listings
    # authorize @markers
  end

  def show
    @booking = Booking.new
    @markers =
      [{
        lat: @listing.latitude,
        lng: @listing.longitude#,
        # infoWindow: { content: render_to_string(partial: "/flats/map_box", locals: { flat: flat }) }
      }]
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
  end

  def update
    @listing.update(listing_params)
    authorize @listing
    redirect_to listing_path(@listing)
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
