Rails.application.routes.draw do
  devise_for :users
  resources :places
  resources :reviews, only: [:create, :destroy]
  
  # Добавляем маршрут для профиля пользователя (из main)
  resources :users, only: [:show]
  
  # Корневой путь
  root to: 'places#index'
end