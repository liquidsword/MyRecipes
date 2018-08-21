class RecipesController < ApplicationController
  
  def show
    @recipe = Recipe.find(params[:id])
    if @recipe.ingredients.last.try(:name)
       @recipe.ingredients.build
    end
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    5.times {@recipe.ingredients.build}
  end

  def create
    @culinary_artist = current_user
    @recipe = @culinary_artist.recipes.build(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  private
    def recipe_params
        params.require(:recipe).permit(:title, :instructions, ingredients_attributes: [:id, :name, :quantity])

    end
end
