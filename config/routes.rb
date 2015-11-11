Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index, :show]
  resources :categories, only: [:show]
  resources :brands, only: [:show]
  resources :cart_items, only: [:create, :destroy, :update]
  resources :users, only: [:new, :create, :show]
  get '/cart', to: 'cart#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
