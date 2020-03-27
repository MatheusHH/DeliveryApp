require 'sidekiq/web'
Rails.application.routes.draw do
  resources :products
  mount Sidekiq::Web => '/sidekiq'
  
  devise_for :users
  resources :users
  get 'dashboard/index'
  root 'dashboard#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
