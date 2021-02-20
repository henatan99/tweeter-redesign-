class ApplicationController < ActionController::Base
  private

  def require_login
    return if current_user
    
    redirect_to new_session_path, alert: 'Sign up or Log in!'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
