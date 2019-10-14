FactoryBot.define do
  factory :user do
    name { "testuser1" }
    email { Faker::Internet.free_email }
    nick_name { Faker::Name.last_name }
    icon { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/octo.png'), 'image/png') }
    password = Faker::Internet.password(8)
    password { password }
    password_confirmation { password }
  end
end