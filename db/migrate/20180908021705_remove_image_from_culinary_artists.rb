class RemoveImageFromCulinaryArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :culinary_artists, :image, :string
  end
end
