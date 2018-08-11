class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :current_user

  before_action :require_logged_in, except: [:new, :create, :home]

  def logged_in?
    !!current_user.nil
  end

  private
    def require_logged_in
      redirect_to root_path unless logged_in?
    end

    def current_user
      @current_user ||= Culinary_artist(session[:culinary_artist_id]) if session[:culinary_artist_id]
    end
end
