Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/new'
  get 'movies/show'
  get 'movies/edit'
  get 'movies/create'
  get 'movies/update'
  get 'movies/destroy'
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/show'
  get 'reviews/edit'
  get 'reviews/create'
  get 'reviews/update'
  get 'reviews/destroy'
  root 'homes#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
