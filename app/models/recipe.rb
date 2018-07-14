class Recipe < ApplicationRecord
  has_many :recipe_categories
  has_many :categories, through: :recipe_categories
  
  belongs_to :culinary_artist

  has_many :ingredients

  accepts_nested_attributes_for :ingredients

  def erase_empty_ingredients
    self.ingredients = self.ingredients.select {|i| i.name && i.name != '' || i.quantity && i.quantity !=''}
end
