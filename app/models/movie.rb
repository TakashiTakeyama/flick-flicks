class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum watched_by: [:watched_by, :Amazon_Prime, :NetFlix, :映画館, :レンタル]
  has_many :reviews
  has_many :favorite_movies
  # has_many :favorite_movie, through: :favorite_reviews, source: :user
  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories
end

