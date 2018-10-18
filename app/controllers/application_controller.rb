class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_action :require_login, except: [:new, :create, :home]

private

  def current_user
    @current_user ||= CulinaryArtist.find(session[:culinary_artist_id]) if session[:culinary_artist_id]
  end

  def require_login
    redirect_to signin_path, :notice => "Please sign in" unless logged_in?

  end

  def logged_in?
    current_user ? true : false
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  def redirect_if_not_logged_in
    redirect_to signin_path unless logged_in?
  end

  helper_method :current_user, :logged_in?

end
