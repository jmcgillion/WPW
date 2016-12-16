class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  include ApplicationHelper
  before_action :configure_permitted_parameters, if: :devise_controller?

  def is_login?
  	unless current_user
  	  redirect_to "/"
  	end
  end


   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up).push(:email,:password, :password_confirmation)
   end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
     category_path(1)

    end
  end
end
