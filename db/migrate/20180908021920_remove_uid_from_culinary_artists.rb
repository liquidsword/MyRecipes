class RemoveUidFromCulinaryArtists < ActiveRecord::Migration[5.2]
  def change
    remove_column :culinary_artists, :uid, :string
  end
end
