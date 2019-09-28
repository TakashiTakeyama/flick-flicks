class Review < ApplicationRecord
  validates :impression, presence: true, length: { maximum: 300 }
  has_many :favorite_reviews, dependent: :destroy
  # has_many :favorite_users, through: :favorite_reviews, source: :user
  belongs_to :user, optional: true
  belongs_to :movie, optional: true
end
