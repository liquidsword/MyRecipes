class AddCulinaryArtistIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :culinary_artist_id, :integer
  end
end
