class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index, :requests]
  skip_after_action :verify_authorized, only: [:show, :index, :requests]
  skip_after_action :verify_policy_scoped, only: [:index, :requests]
  def review
    @listing = Listing.find(params[:listing_id])
    authorize @listing
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.listing.renter_id == @booking.renter_id
      if @booking.save
        redirect_to my_listings_path
        flash[:notice] = "Successful Booking"
      else
        @listing = Listing.find(@booking.listing_id)
        redirect_to schedule_path(@booking.listing)
        flash[:alert] = "Unsuccessful Booking"
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

  def index
    bookings = Booking.where(renter_id: current_user.id)
    @my_rentals = bookings.select{ |booking| booking.renter_id != booking.listing.id}
    listings = Booking.where(listing: current_user)
    @my_listings = listings.select{ |listing| listing.renter_id != listing.listing_id}

  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to edit_listing(@booking.listing)
    authorize @booking
  end

  def show

  end

  def requests
    @bookings = Booking.all
    @requests = []
    @bookings.each do |booking|
      if ((booking.listing.renter == current_user) && (booking.accepted.nil?))
        if booking.listing.renter != booking.renter
          @requests << booking
        end
      end
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to request_path
  end
  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :listing_id, :renter_id)
  end
end
