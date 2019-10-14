FactoryBot.define do
  factory :movie do
    title { "ロッキー１" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/octo.png'), 'image/png') }
  end

  factory :second_movie, class: Movie do
    title {'ロッキー２'}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/octo.png'), 'image/png') }
  end

  factory :third_movie, class: Movie do
    title {'ロッキー３'}
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/octo.png'), 'image/png') }
  end
end