Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  #http://localhost:3000でこれが表示
  resources :customers
  resources :reservation_requests
  resources :notifications, only: [:index, :destroy]
end
