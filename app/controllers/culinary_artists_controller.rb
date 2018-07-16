class CulinaryArtistsController < ApplicationController
  before_action :require_login
  before_action :set_culinary_artist, only: [:show, :edit, :update, :destroy]

  def new
    @culinary_artist = CulinaryArtist.new
  end

  def create
    @culinary_artist = CulinaryArtist.new(culinary_artist_params)
    respond_to do |format|
      if @culinary_artist.save
        session[:culinary_artist_id] = @culinary_artist.id
        format.html { redirect_to culinary_artist_path(@culinary_artist), notice: "Welcome to your recipes, your very own culinary journey!"}
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @culinary_artist.update(culinary_artist_params)
        format.html { redirect_to @culinary_artist, notice: 'Culinary Artist updated.'}
      else
        format.html { render :edit }
      end
  end
end

private

  def require_login
    return head(:forbidden) unless session.include? :culinary_artist_id

  end

  def set_culinary_artist
    @culinary_artist = CulinaryArtist.find(params[:id])
  end

  def culinary_artist_params
    params.require(:culinary_artist).permit(:culinary_artist_name, :password)
  end
end
