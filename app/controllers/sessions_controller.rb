class SessionsController < ApplicationController

  def new
     #@redirect_if_logged_in
     @culinary_artist = CulinaryArtist.new
   end

  def create
    @culinary_artist = CulinaryArtist.find_by(culinary_artist_name: session_params[:culinary_artist_name])
    session[:culinary_artist_id] = @culinary_artist_id
    if @culinary_artist && @culinary_artist.authenticate(params[:culinary_artist][:password])
      session[:culinary_artist_id]= @culinary_artist_id
      redirect_to culinary_artist_recipes_path(@culinary_artist) #after logging in successfully it is redirected to the culinary_artists#show
    else
      @culinary_artist = CulinaryArtist.new(culinary_artist_name: session_params[:culinary_artist_name])
      flash[:error] = "Something went wrong, please try again"
      render :new
    end
  end

  def destroy
    session.culinary_artist_id = nil
    redirect_to logout_path, :notice => "Goodbye :)"
  end

  def omnicreate
    if auth_hash = request.env["omniauth.auth"]
      @culinary_artist = CulinaryArtist.find_or_create_by_omniauth(auth_hash)
      session[:culinary_artist_id] = @culinary_artist.id
      redirect_to @culinary_artist
    else
      render 'sessions/new'
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  def session_params
    params.require(:culinary_artist).permit(:culinary_artist_name, :password)
  end
end
