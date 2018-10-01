class CulinaryArtist < ApplicationRecord
  validates :culinary_artist_name, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :recipes
  has_many :ingredients, through: :recipes

  def password
    @password ||= Password.new(password_digest)
  end

  def password = (new_password)
    @password = Password.create(new_password)
    self.password_digest = @password

  end
end
