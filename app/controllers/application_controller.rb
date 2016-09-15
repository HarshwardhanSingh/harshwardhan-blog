class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= Admin.find(session[:user_id]) if session[:user_id]
  end

  private

  def authenticate_user!
    redirect_to new_session_path, flash: { error: "You need to sign in for that!!" } if session[:user_id].blank?
  end
end
