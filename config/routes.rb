Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root :to => "users#new"
  get    '/login'  ,   to: 'sessions#new'
  get    '/signup' ,   to: 'users#new'
  get    '/index'  ,   to: 'home#index'
  post   '/login'  ,   to: 'sessions#create'
  delete '/logout' ,   to: 'sessions#destroy'
  get    '/index'  ,   to: 'home#index'
  get    '/newpost' ,   to: 'posts#new'
  post   '/newpost', to: 'posts#create'
  get    '/add_topic', to: 'home#add_topic'
  get    '/clear_topic', to: 'home#clear_topic'
  get    '/selected_topic', to: 'home#filter_index'
  get     '/index/:id' , to: 'home#bypass' 
  resources :users
  resources :posts
  resources :password_resets, only: [:new, :create, :edit, :update]
 # check home_controller
end
