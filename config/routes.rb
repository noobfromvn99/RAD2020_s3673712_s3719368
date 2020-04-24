Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/index', to: 'home#index'
  resources :users
end
