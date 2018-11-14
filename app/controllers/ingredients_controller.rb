class IngredientsController < ApplicationController

  def new
    if params[:recipe_id]
      @recipe = Recipe.find_by(params[:recipe_id])
      @recipe_ingredient = @recipe.recipe_ingredients.build
      @ingredient = @recipe_ingredient.build_ingredient
    else
      @ingredient = Ingredient.new
    end
  end

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def create
    @ingredient = Ingredient.new(params[:id])
  end

  def edit
    @ingredient = Ingredient.find_by(params[:id])
  end

  def update
    @ingredient = Ingredient.find_by(params[:id])
  end

  def destroy
    @ingredient = Ingredient.find_by(params[:id])
    @ingredient.destroy
  end

end
