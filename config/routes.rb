Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'homes#index'
  resources :reviews
  resources :favorite_reviews, only: [:create, :destroy]
  resources :favorite_movies, only: [:create, :destroy]
  resources :categories
  resources :users, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :movies do
    member do
      resources :reviews
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
