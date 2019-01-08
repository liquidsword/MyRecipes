class Recipe < ApplicationRecord

  validates_presence_of :title

  belongs_to :culinary_artist
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  #scope :updated, -> { order (updated_at: :desc) }

  accepts_nested_attributes_for :ingredients, :allow_destroy => true
  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true

    #def recipe_ingredients_attributes=(recipe_ingredients_attributes)  #has_many_through lesson lab
      #recipe_ingredients_attributes.values.each do |recipe_ingredients_attribute|
        #recipe_ingredient = RecipeIngredient.find_or_create_by(recipe_ingredients_attribute)
        #self.recipe_ingredients << recipe_ingredient
      #end
    #end

    def erase_empty_ingredients
      self.ingredients = self.ingredients.select {|i| i.ingredient_name && i.ingredient_name != '' || i.quantity && i.quantity !=''}
    end

    def self.updated
      order(updated_at: 'desc')
    end

    def alpha
      @recipes = Recipe.all
      @recipes.order(title: 'desc') #tell which view to render, move to model, call the scope method here
      render 'index'
    end

    #objects_array.sort! { |a, b|  a.attribute <=> b.attribute }    #ascending order
    #objects_array.sort_by{ |obj| obj.attribute }      #ascending order

    #objects_array.sort! { |a, b|  b.attribute <=> a.attribute }   #descending Order
    #objects_array.sort_by{ |obj| obj.attribute }.reverse  #descending Order
end
