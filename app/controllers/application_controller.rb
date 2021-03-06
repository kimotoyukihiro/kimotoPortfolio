class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :hairdresser,:salon_name, :salon_address])
  end

   before_action :set_search
	def set_search
	  @search = Item.ransack(params[:q])
	  @search_items = @search.result
	end
end


