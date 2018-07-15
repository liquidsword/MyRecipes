class CulinaryArtist < ApplicationRecord
  has_secure_password

  has_many :recipes
  has_many :categories through: :recipes
end
