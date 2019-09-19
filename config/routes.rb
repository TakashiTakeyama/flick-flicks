Rails.application.routes.draw do
  root 'homes#index'
  resources :reviews
  # resources :movies
  resources :movies do
    member do
      resources :reviews
    end
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
