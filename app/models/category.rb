class Category < ApplicationRecord
  has_many :movie_categories, dependent: :destroy
  has_many :movies, through: :movie_categories
end
