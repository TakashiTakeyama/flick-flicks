class Movie < ApplicationRecord
  validates :title, presence: true,
            uniqueness: true,
            length: { maximum: 30 }
  validates :image, presence: true
  mount_uploader :image, ImageUploader

  enum watched_by: [:watched_by, :Amazon_Prime, :NetFlix, :映画館, :レンタル]
  has_many :reviews, dependent: :destroy
  has_many :favorite_movies
  # has_many :favorite_movie, through: :favorite_reviews, source: :user
  has_many :movie_categories, dependent: :destroy
  has_many :categories, through: :movie_categories
  has_one_attached :image
end

