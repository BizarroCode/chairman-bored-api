Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :games
  resources :tags
  get 'bgg/search', to: 'bgg#search'

  # Defines the root path route ("/")
  root "games#index"
end
