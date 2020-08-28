Rails.application.routes.draw do
  

  get 'favorite_relationships/create'

  get 'favorite_relationships/destroy'

  root 'static_pages#home'
  
  post '/guest_log_in', to: 'sessions#new_guest'

  get    '/help',    to: 'static_pages#help'
  
  get    '/about',   to: 'static_pages#about'
  
  get    '/contact', to: 'static_pages#contact'
  
  get    '/signup',  to: 'users#new'
  
  get    '/login',   to: 'sessions#new'
  
  post   '/login',   to: 'sessions#create'
  
  delete '/logout',  to: 'sessions#destroy'
  
  get    'maps/index',  to: 'maps#index'
  
  resources :users do
    member do 
      get :following, :followers, :likes
    end 
  end 
  
    
  
  
  resources :account_activations, only: [:edit]
  
  resources :password_resets, only: [:new, :create, :edit, :update]
  
  resources :posts, only: [:show, :content, :title, :create, :destroy]
  
  resources :comments


  resources :relationships, only: [:create, :destroy]
  
  resources :favorite_relationships, only: [:create, :destroy]
  
  resources :maps, only: [:index]
  
end
