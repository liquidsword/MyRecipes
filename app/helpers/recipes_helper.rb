module RecipesHelper
  def culinary_artist_id_field(recipe)
       if @recipe.culinary_artist.nil?
         select_tag "recipe[culinary_artist_id]",
          options_from_collection_for_select(CulinaryArtist.all, :id, :culinary_artist_name)
       else
        hidden_field_tag "recipe[culinary_artist_id]", recipe.culinary_artist_id
      end
    end
end
