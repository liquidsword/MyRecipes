Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "home_page#home"
get "/signin", to: "sessions#new"
post "/signin", to: "sessions#create"
get '/auth/facebook/callback' => 'sessions#omnicreate'
post "/logout", to: "sessions#destroy"

resources :recipes
resources :culinary_artists
end
