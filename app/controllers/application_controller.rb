class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #before_action :require_login, except: [:new, :create, :home]

helpers do
  def current_user
    @current_user ||= CulinaryArtist.find_by(id: session[:culinary_artist_id])
  end

  def logged_in?
    current_user ? true : false
  end

  def redirect_if_logged_in
    redirect_to root_path if logged_in?
  end

  def redirect_if_not_logged_in
    redirect_to login_path unless logged_in?
  end

end

end
