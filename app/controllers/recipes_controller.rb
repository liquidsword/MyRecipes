class RecipesController < ApplicationController

  def index
    if params[:culinary_artist_id]
      @recipes = CulinaryArtist.find(params[:culinary_artist_id]).recipes
      @culinary_artist_id = params[:culinary_artist_id]
    else
      @recipes = Recipe.all
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    if params[:culinary_artist] && !CulinaryArtist.exists? (params[:culinary_artist_id])
      redirect_to culinary_artists_path, alert: "CulinaryArtist not found!"
    else
      @recipe = Recipe.new(culinary_artist_id: params[:culinary_artist_id])
      3.times { @recipe.recipe_ingredients.build} #this seems to work
    end
  end

  def create
    @recipe = Recipe.create(recipe_params)
    @recipe.culinary_artist_id = current_user
    if @recipe.valid?
       @recipe.save
      redirect_to recipe_path(@recipe)
    else
      3.times { @recipe.recipe_ingredients.build } #added 10-2-18
      render 'new'
    end
  end

  def edit
    if params[:culinary_artist_id]
      culinary_artist = CulinaryArtist.find_by(id: params[:culinary_artist_id])
      if culinary_artist.nil?
        redirect_to culinary_artists_path, alert: "CulinaryArtist not found."
      else
        @recipe = culinary_artist.recipes.find_by(id: params[:id])
        redirect_to culinary_artist_recipes_path(culinary_artist), alert: "Couldn't find that recipe!" if @recipe.nil?
      end
    else
    @recipe = Recipe.find(params[:id])
  end
end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def destroy
    @recipe = Recipe.find_by(params[:id])
    @recipe.destroy
  end

  private
    def recipe_params
        params.require(:recipe).permit(:culinary_artist_id, :title, :instructions, recipe_ingredients_attributes: [:id, :name])

    end
end
