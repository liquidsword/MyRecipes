Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root "static_pages#home"
get "/signin", to: "sessions#new"
post "/sessions/create", to: "sessions#create", as: 'register'
delete "/signout", to: "sessions#destroy"

resources :recipes
resources :culinary_artists
end
