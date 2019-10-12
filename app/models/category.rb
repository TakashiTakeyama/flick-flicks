class Category < ApplicationRecord
  validates :name, presence: true, length: { maximum: 15 }
  validates :name, uniqueness: true
  has_many :movie_categories, dependent: :destroy
  has_many :movies, through: :movie_categories
end
