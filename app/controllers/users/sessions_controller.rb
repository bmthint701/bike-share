module Users
  class SessionsController < Devise::SessionsController
   def new
    # byebug
     self.resource = resource_class.new(sign_in_params)
     store_location_for(resource, params[:redirect_to])
     super
   end
  end
end
