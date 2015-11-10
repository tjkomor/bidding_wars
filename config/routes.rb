Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index]
  resources :categories, only: [:show]
end
