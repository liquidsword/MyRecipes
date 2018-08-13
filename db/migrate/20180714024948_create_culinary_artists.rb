class CreateCulinaryArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :culinary_artists do |t|
      t.string :culinary_artist_name
      t.string :email
      t.string :password_digest
      t.string :image
      t.string :uid

      t.timestamps
    end
  end
end
