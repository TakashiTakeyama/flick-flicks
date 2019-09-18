class Movie < ApplicationRecord
  mount_uploader :image, ImageUploader

  enum watched_by: [:Amazon_Prime, :NetFlix, :映画館, :レンタル]
end
