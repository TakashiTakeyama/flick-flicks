Rails.application.routes.draw do
  get 'ranking/index'
  get 'flicks/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers:  {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  devise_scope :user do
    get 'my_page' => 'users/registrations#my_page'
    end
  root 'homes#index'
  resources :reviews
  resources :favorite_reviews, only: [:create, :destroy]
  resources :favorite_movies, only: [:create, :destroy]
  resources :categories
  resources :users, only: [:index,:show]
  resources :relationships, only: [:create, :destroy]
  resources :movies do
    member do
      resources :reviews
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
