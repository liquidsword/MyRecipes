class Ingredient < ApplicationRecord
  validates :name, presence: true
  belongs_to :recipe
  has_many :culinary_artists, through: :recipes
end
