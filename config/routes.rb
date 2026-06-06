Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :places do
    resources :reviews, only: [:create, :destroy]
  end
  
  root to: 'places#index'
end