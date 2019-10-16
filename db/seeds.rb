# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.create!(name: "admin_user",
               email: "admin_user@gmail.com",
               password: "aaaaaa",
               password_confirmation: "aaaaaa",
               admin_flg: true,
               )

  User.create!(name: "test_user",
               email: "test_user@gmail.com",
               password: "aaaaaa",
               password_confirmation: "aaaaaa",
               )

1.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email(10,29)
  image = Faker::Avatar.image,
  password = "password"
  User.create!(name: name,
               email: email,
               icon: image,
               password: password,
               password_confirmation: password,
               )

end
