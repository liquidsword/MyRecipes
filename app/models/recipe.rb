class Recipe < ApplicationRecord

  validates_presence_of :title

  belongs_to :culinary_artist
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  #scope :alpha, -> { order (title: 'desc') }

  accepts_nested_attributes_for :ingredients, :allow_destroy => true
  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true

    def erase_empty_ingredients
      self.ingredients = self.ingredients.select {|i| i.ingredient_name && i.ingredient_name != '' || i.quantity && i.quantity !=''}
    end

    def self.updated
      order(updated_at: 'desc')
    end

    def self.alphabetize
      order(title: :asc).to_a #***works***
      #More elegant objects.sort_by(&:attribute), you can add on a .reverse
    end

end
