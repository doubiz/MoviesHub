FactoryGirl.define do
  factory :movie do
    name "Mysterious Ruby Movie"
    duration "120"
    release_date Date.today

    trait :with_ratings do
      after(:create) do |movie|
        (1..5).each do |value|
          create(:rating, user_id: create(:user).id, value: value, movie_id: movie.id)
        end
      end
    end

    factory :movie_with_ratings, traits: [:with_ratings]
  end
end
