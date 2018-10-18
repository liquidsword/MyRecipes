class RecipeIngredientController < ApplicationController

  def index
    if params[:culinary_artist_id]
      @recipe_ingredients = CulinaryArtist.find(params[:culinary_artist_id]).recipe_ingredients
    else
      @recipe_ingredients = Recipe_ingredient.all
  end

  def show
    @Recipe_ingredient = Recipe_ingredient.find_by(params[:id])
  end

  def new
    @recipe_ingredient = Recipe_ingredient.new
  end

  def edit
    @recipe_ingredient = Recipe_ingredient.find_by(params[:id])
  end

  def create
    @recipe_ingredient = Recipe_ingredient.new(params[:recipe_ingredient])
    if @recipe_ingredient.save
      redirect_to @recipe_ingredient, notice: "New recipe_ingredient saved!"
    else
      render 'new'
    end
  end

  def destroy
    @recipe_ingredient = Recipe_ingredient.find_by(params[:id])
    @recipe_ingredient.destroy    
  end
end
