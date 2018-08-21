class CulinaryArtistsController < ApplicationController
  #before_action :require_login
  #before_action :set_culinary_artist, only: [:show, :edit, :update, :destroy]

  def new
    logged_in?
    @culinary_artist = CulinaryArtist.new
    #redirect_to '/culinary_artists/new'
  end

  def create
    @culinary_artist = CulinaryArtist.new(culinary_artist_params)
  end


private

  def require_login
    return head(:forbidden) unless session.include? :culinary_artist_id
  end

  #def set_culinary_artist
    #@culinary_artist = CulinaryArtist.find(params[:id])
  #end

  def culinary_artist_params
    params.require(:culinary_artist).permit(:culinary_artist_name, :password, :password_confirmation)
  end
end
