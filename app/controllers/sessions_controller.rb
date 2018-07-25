class SessionsController < ApplicationController
  
  def destroy
    session[:culinary_artist_id] = nil
    redirect_to root_url

  end

  def new
    @culinary_artist = CulinaryArtist.new
    @culinary_artists = CulinaryArtist.all
  end

  def create
    @culinary_artist = CulinaryArtist.find_by(culinary_artist_name: params[:culinary_artist][:culinary_artist_name])
    if @culinary_artist && @culinary_artist.authenticate(params[:culinary_artist][:password])
      session[:culinary_artist_id]= @culinary_artist.id
    else
      redirect_to signin_path
    end
  end
end
