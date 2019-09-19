Rails.application.routes.draw do
  root 'homes#index'
  resources :movies do
    resources :reviews
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
