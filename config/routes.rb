Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  # http://localhost:3000でこれが表示
  resources :customers do
    collection do
      get :search
    end
  end
  resources :reservation_requests
  resources :notifications, only: %i[index destroy]
  get 'terms', to: 'pages#terms'
  get 'privacy', to: 'pages#privacy'
end
