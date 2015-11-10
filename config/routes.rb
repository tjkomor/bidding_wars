Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index]
  resources :categories, only: [:show]
  resources :cart_items, only: [:create]
  get '/cart', to: 'cart#index'
end
