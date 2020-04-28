Rails.application.routes.draw do
  #by adding here u can just access  post with posts/id, redirect_to @post
  root :to => "users#new"
  get    '/login'  ,   to: 'sessions#new'
  get    '/signup' ,   to: 'users#new'
  get    '/index'  ,   to: 'home#index'
  post   '/login'  ,   to: 'sessions#create'
  delete '/logout' ,   to: 'sessions#destroy'
  get    '/index'  ,   to: 'home#index'
  get    '/post' ,   to: 'posts#new'
  post   '/post', to: 'posts#create'
  resources :users
  resources :posts
 # check home_controller
end
