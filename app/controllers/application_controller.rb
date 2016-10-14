class ApplicationController < ActionController::Base
  
  protect_from_forgery with: :exception

  private
    def render_403
    	render file: "public/403.html", status: 403
    end  

    def render_404
    	render file: "public/404.html", status: 404
    end

  #   def check_if_admin
		# 	render_403 unless params[:admin]
		# end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:login])
    devise_parameter_sanitizer.permit(:account_update, keys: [:login])
  end
		
end
