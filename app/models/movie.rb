class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum watched_by: [:Amazon_Prime, :NetFlix, :映画館, :レンタル]
  has_many :reviews
  has_many :favorite_movies, dependent: :destroy
  # has_many :favorite_movie, through: :favorite_reviews, source: :user
end

