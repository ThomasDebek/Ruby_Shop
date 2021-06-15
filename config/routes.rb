# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'
  devise_for :administrators
  devise_for :users
  
  namespace :administrator do
    root 'products#index'
  end

end
