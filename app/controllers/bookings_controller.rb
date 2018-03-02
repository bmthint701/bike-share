class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  skip_after_action :verify_authorized, only: [:show]
  def review
    @listing = Listing.find(params[:listing_id])
    authorize @listing
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.listing.renter_id == @booking.renter_id
      if @booking.save
        redirect_to my_listings_path
      else
        @listing = Listing.find(@booking.listing_id)
        redirect_to schedule_path(@booking.listing)
      end
    else
      if @booking.save
        redirect_to booking_confirm_path(@booking)
      else
      @listing = Listing.find(@booking.listing_id)
      redirect_to listing_path(@listing)
      end
    end
    authorize @booking
  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def show
    bookings = Booking.where(renter_id: current_user.id)
    @my_rentals = bookings.select{ |booking| booking.renter_id != booking.listing.id}
    listings = Booking.where(listing: current_user)
    @my_listings = listings.select{ |listing| listing.renter_id != listing.listing_id}
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :listing_id, :renter_id)
  end
end
