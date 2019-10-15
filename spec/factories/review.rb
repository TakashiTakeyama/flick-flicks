FactoryBot.define do
  factory :review do
    impression { "'a'*100" }
    user_id { User.last.id }
    movie_id { Movie.last.id }
  end
end