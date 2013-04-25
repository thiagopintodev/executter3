class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :me

  def set_current_user(user)
    @current_user = nil
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find session[:user_id] rescue nil
  end
  alias :me :current_user

end
