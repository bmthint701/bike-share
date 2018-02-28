class BookingsController < ApplicationController
  def review
    @listing = Listing.find(params[:listing_id])
    authorize @listing
  end

  def create
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_confirm_path(@booking)
    else
      render 'listings/show.html'
    end
    authorize @booking
  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :listing_id, :renter_id)
  end
end
