require 'faker'
FactoryGirl.define do
  factory :user do
    email {Faker::Internet.email}
    password "1234567890"
    name {Faker::Name.name }
    account_type 0
    trait :with_movie do
      after(:create) do |user|
        user.movies << create(:movie)
      end
    end
    trait :with_movie_and_rating do |user|
      after(:create) do |user|
        movie = create(:movie)
        movie.ratings << create(:rating, user_id: user.id, value: 5)
        user.movies << movie
      end
    end
    factory :user_with_movie, traits: [:with_movie]
    factory :user_with_movie_and_rating, traits: [:with_movie_and_rating]
  end

  
  factory :admin, class: "User" do
    email {Faker::Internet.email}
    password "1234567890"
    name {Faker::Name.name} 
    account_type 1
  end
end