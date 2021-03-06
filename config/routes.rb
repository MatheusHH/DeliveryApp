require 'sidekiq/web'
Rails.application.routes.draw do
  
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users, controllers: {registrations: 'user/registrations'}
  post '/webhooks', to: 'webhooks#webhooks'
  resources :users
  resources :order, only: [:index, :show]
  resources :products
  resources :categories
  resources :payments, only: [:show, :create]
  resources :order_items
  resource :carts, only: [:show]
  resources :checkout_free, only: [:show]
  resources :deliveries, except: [:new]
  get 'dashboard/index'
  root 'dashboard#index'
  get 'reports/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
