class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include DefaultPageContent

  #Run method "configure_permitted_parameters" if communicating with devise_for
  before_filter :configure_permitted_parameters, if: :devise_controller?

  #alternate way to white listing parameters that are passed in
  def configure_permitted_parameters
    #allows name to be passed to "sign_up" page aka /register
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #allows name to be passed to "account_update" page aka /edit
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def current_user
    super || OpenStruct.new(name: "Guest User", first_name: "Guest",
    last_name: "User", email: "guest@yahoo.com")
  end

end
