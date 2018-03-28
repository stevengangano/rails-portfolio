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

  #if there is current_user logged leave as is (super)
  #if not, show Guest User
  def current_user
    super || guest_user
  end

  def guest_user
    guest = GuestUser.new
    guest.name = "Guest User"
    guest.first_name = "Guest"
    guest.last_name = "User"
    guest.email = "guest@example.com"
    guest
  end

end
