Rails.application.routes.draw do
  get 'home/index'
  root :to => "home#index"
  get    '/login'  ,   to: 'sessions#new'
  get    '/signup' ,   to: 'users#new'
  get    '/index'  ,   to: 'home#index'
  post   '/login'  ,   to: 'sessions#create'
  delete '/logout' ,   to: 'sessions#destroy'
  get    '/post' ,   to: 'posts#new'
  post   '/post', to: 'posts#create'
  resources :users
  resources :posts
end
