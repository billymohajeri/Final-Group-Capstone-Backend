Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :reservations
  resources :rooms
  resources :users

  post '/login', to: 'sessions#create'
  get '/current_user', to: 'sessions#current_user'
  delete '/logout', to: 'sessions#destroy'
end
