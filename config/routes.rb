Rails.application.routes.draw do
  root to: 'home#index'
  resources :items, only: [:index, :show]
  resources :stores, only: [:show], param: :slug
  resources :bid_histories, only: [:create, :destroy, :update]
  resources :charges

  patch '/cart_quantity', to: 'cart_items#quantity'

  resources :users, only: [:new, :create, :destroy, :edit, :update] do
    resources :rentals, only: [:index, :create, :show, :update]
    resources :addresses, only: [:edit, :update]
  end
  namespace :admin do
    get '/dashboard', to: 'dashboard#show'
    get '/dashboard/customers', to: 'dashboard#customers'
    resources :categories, only: [:new, :create]
    resources :orders, only: [:show, :update, :index]
    resources :items, only: [:new, :create, :index, :edit, :update]
    resources :stores, only: [:new, :create]
  end
  get '/dashboard', to: 'users#show'
  get '/cart', to: 'cart#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:category', to: 'categories#show', param: :slug
end
