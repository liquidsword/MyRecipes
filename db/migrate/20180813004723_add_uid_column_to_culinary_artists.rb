class AddUidColumnToCulinaryArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :culinary_artists, :uid, :integer
  end
end
