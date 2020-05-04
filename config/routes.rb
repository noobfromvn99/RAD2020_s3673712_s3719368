Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root :to => "home#index"
  get    '/login'  ,   to: 'sessions#new'
  get    '/signup' ,   to: 'users#new'
  get    '/index'  ,   to: 'home#index'
  post   '/login'  ,   to: 'sessions#create'
  delete '/logout' ,   to: 'sessions#destroy'
  get    '/index'  ,   to: 'home#index'
  get    '/newpost',   to: 'posts#new'
  post   '/newpost',   to: 'posts#create'
  get    '/add_topic', to: 'home#add_topic'
  get    '/clear_topic'   , to: 'home#clear_topic'
  get    '/selected_topic', to: 'home#filter_index'
  get    '/avatar'         , to: 'users#avatar'
  get    '/password'         , to: 'users#password'
  get    '/setting'    , to: 'users#edit'
  post    '/setting'   , to: 'users#update'
  get    '/my_post',   to: 'users#my_posts'
  get    '/my_comment',   to: 'users#my_comments'    
  get    '/other_comment',   to: 'users#other_comments'    
  get     '/session_bypass', to: 'sessions#bypass'
  post     '/comments', to: 'posts#comment'
  get     '/reply', to: 'posts#reply'
  post    '/reply', to: 'posts#create_reply'
  get     '/search', to: 'home#search_index'
  patch    '/avatar_upload', to: 'users#upload_avatar'
  resources :users
  resources :posts
  resources :comments
  resources :password_resets, only: [:new, :create, :edit, :update]##here
 # check home_controller
end
