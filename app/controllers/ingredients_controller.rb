class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find_by(params[:id])
  end

  def new
    @ingredient = Ingredient.new
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
