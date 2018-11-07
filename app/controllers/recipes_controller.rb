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
    @recipe = Recipe.find_by(params[:id])
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.recipe_ingredients.build} #this seems to work
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
    @recipe = Recipe.find(params[:id])
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
        params.require(:recipe).permit(:culinary_artist, :title, :instructions, ingredients_attributes: [:id, :name, :quantity])

    end
end
