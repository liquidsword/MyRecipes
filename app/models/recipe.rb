class Recipe < ApplicationRecord
  attr_accessor :title, :culinary_artist, :ingredients_attributes, :recipe_ingredients_attributes

  validates :title, presence: true
  validates :culinary_artist, presence: true

  belongs_to :culinary_artist
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients


  accepts_nested_attributes_for :ingredients, :allow_destroy => true
  accepts_nested_attributes_for :recipe_ingredients, :allow_destroy => true

  scope :by_title, -> {order (title: :asc)}
  scope :by_recent_update, -> {order (updated_at: :desc)}

  def erase_empty_ingredients
    self.ingredients = self.ingredients.select {|i| i.name && i.name != '' || i.quantity && i.quantity !=''}
  end
end
