class User < ApplicationRecord
  mount_uploader :icon, ImageUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :favorite_reviews, dependent: :destroy
  has_many :favo, through: :favorite_reviews, source: :review
  has_many :favorite_movies, dependent: :destroy
  has_many :favorite_movie, through: :favorite_movies, source: :movie
end
