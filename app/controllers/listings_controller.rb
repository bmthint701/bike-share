class ListingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :show]
  skip_after_action :verify_authorized, only: [:search]
  before_action :set_listing, only: [:show, :destroy, :edit, :update, :schedule]

  def new
    @listing = Listing.new
    authorize @listing
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.renter_id = current_user.id
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render:new
    end
    authorize @listing
  end


  def search
    # add active/inactive boolean check
    if params[:term].present?
      @pre_listings = Listing.near(params[:term], 10)
      @listings = @pre_listings.select { |listing| listing.active }
      @search_location = params[:term]
      @header = params[:term]
    else
      # @listings = Listing.where.not(latitude: nil, longitude: nil)
      # @listings = Listing.all
      @search_location = request.remote_ip
      @pre_listings = Listing.near(Geocoder.coordinates(@search_location), 10)
      @listings = @pre_listings.select { |listing| listing.active }
      # @location = '122.130.160.183'
      # request.remote_ip
      @header = "Current Location"
    end

    @hash_of_distances = {}
    @listings.each do |listing|
      coordinates = Geocoder.coordinates(@search_location)
      distance = Geocoder::Calculations.distance_between(coordinates, Geocoder.coordinates(listing.address))
      @hash_of_distances[listing.id] = distance.round(2)
    end

    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        infoWindow: { content: render_to_string(partial: "map_box", locals: { listing: listing, distance: @hash_of_distances[listing.id] }) }

      }
    end
    if @listings.empty?
      @listings = Listing.all
      @header = "All Listings"
    end

    @hash_of_ratings = {}
    @listings.each do |listing|
      total_rating = 0
      listing.reviews.each do |review|
        total_rating += review.rating
      end
      avg_rating = total_rating.to_f / listing.reviews.size
      @hash_of_ratings[listing.id] = avg_rating
    end

    # authorize @listings
  end

  def show
    # @hash_of_distances = {}
    # current_coordinates = Geocoder.coordinates(request.remote_ip)
    # @distance = Geocoder::Calculations.distance_between(current_coordinates, Geocoder.coordinates(@listing.address)).round(2)
    @booking = Booking.new
    @review = Review.new
    @markers =
      [{
        lat: @listing.latitude,
        lng: @listing.longitude,
        infoWindow: { content: render_to_string(partial: "map_box", locals: { listing: @listing }) }
      }]
    @hash_of_ratings = {}

    total_rating = 0
    @listing.reviews.each do |review|
      total_rating += review.rating
    end
    @avg_rating = total_rating.to_f / @listing.reviews.size

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
    @booking = Booking.new
    bookings = Booking.where(listing_id: @listing.id)
    @unavailable_times = bookings.select{ |booking| booking.listing.id == booking.renter.id }
  end

  def update
    @listing.update(listing_params)
    authorize @listing
    redirect_to listing_path(@listing)
  end

  def schedule
    @booking = Booking.new
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
