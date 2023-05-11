Rails.application.routes.draw do
  resources :reservations
  resources :rooms
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login', to: 'sessions#create'
  get '/current_user', to: 'sessions#current_user'
  delete '/logout', to: 'sessions#destroy'
end
