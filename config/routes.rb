# frozen_string_literal: true

Rails.application.routes.draw do

  root 'pages#home'
  devise_for :administrators
  devise_for :users

  namespace :administrator do
    resources :products
    resources :orders, only: %i[index]
    root 'products#index'
  end

  resources :products, only: %i[show]
  resources :orders, only: %i[create]

  #resources :carts, only: %i[show create destroy]

  get    'cart', to: 'carts#show'
  delete 'cart', to: 'carts#destroy'
  post   'cart', to: 'carts#add', as: 'add_to_cart'

end