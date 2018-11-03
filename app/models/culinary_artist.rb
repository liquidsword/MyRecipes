class CulinaryArtist < ApplicationRecord

  validates :culinary_artist_name, presence: true
  has_secure_password
  has_many :recipes
  has_many :ingredients, through: :recipes

end
