class Recipe < ApplicationRecord

  validates_presence_of :title

  belongs_to :culinary_artist
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  #scope :updated, -> { order (updated_at: :desc) }

  accepts_nested_attributes_for :ingredients, :allow_destroy => true
  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true

    def erase_empty_ingredients
      self.ingredients = self.ingredients.select {|i| i.name && i.name != '' || i.quantity && i.quantity !=''}
    end

    def self.updated
      order(updated_at: 'desc')
    end
end
