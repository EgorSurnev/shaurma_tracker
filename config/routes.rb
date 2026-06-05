Rails.application.routes.draw do
  devise_for :users

  resources :places do
    resources :reviews, only: [:create]
  end

  root "places#index"
end