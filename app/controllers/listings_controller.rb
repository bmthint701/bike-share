class ListingsController < ApplicationController
  def search
    # @listings = if params[:term]
    #   Listing.where('address ILIKE ?', "%#{params[:term]}%").all
    # else
    #   Listing.all
    # end
  end
end
