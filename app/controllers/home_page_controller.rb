class HomePageController < ApplicationController

  def home
    if session[:culinary_artist_id]
      @culinary_artist = CulinaryArtist.find(session[:culinary_artist_id])
    end
  end
end
