Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "home_page#home"
get "/signin", to: "sessions#new"
post "/signin", to: "sessions#create"
get '/auth/facebook/callback' => 'sessions#omnicreate'
get "/logout", to: "sessions#destroy"

resources :culinary_artists do
  resources :recipes
end

resources :recipes

resources :recipe_ingredients

resources :ingredients

end
