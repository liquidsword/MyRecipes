Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "home_page#home"
get "/signin", to: "sessions#new"
post "/signin", to: "sessions#create"
get '/auth/:provider/callback' => 'sessions#omnicreate'
get "/logout", to: "sessions#destroy"

resources :culinary_artists, only: [:show, :index] do
  resources :recipes, only: [:show, :index, :new]
end

resources :recipes

resources :recipe_ingredients

resources :ingredients

resources :sessions

end
