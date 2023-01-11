Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :create]

  # Defines the root path route ("/")
  root "games#home"
end
