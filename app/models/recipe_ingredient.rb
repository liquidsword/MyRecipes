class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  accepts_nested_attributes_for :ingredient, allow_destroy: true
  accepts_nested_attributes_for :recipe, allow_destroy: true

  def ingredient=(ingredient)
    self.ingredient_id = Ingredient.find_by(ingredient).id

  end
end
