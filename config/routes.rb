Rails.application.routes.draw do
  devise_for :users
  resources :places
  resources :reviews, only: [:create, :destroy]
  
  # Явно указываем, что для девайс-страниц используем свой layout
  devise_scope :user do
    get '/login', to: 'devise/sessions#new'
    get '/register', to: 'devise/registrations#new'
  end
  
  # Корневой путь
  root to: 'places#index'
end