class ApplicationController < ActionController::Base
  def authenticate_user
    if not current_user
      redirect_to login_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  helper_method :authenticate_user
end
