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
    trait :with_avatar do
      avatar { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images','test.png')) }
    end
    trait :with_link_avatar do
      avatar_url "https://www.google.com.eg/images/nav_logo242.png"
    end

    factory :user_with_movie, traits: [:with_movie]
    factory :user_with_movie_and_rating, traits: [:with_movie_and_rating]
    factory :user_with_avatar, traits: [:with_avatar]
    factory :user_with_link_avatar, traits: [:with_link_avatar]
  end

  
  factory :admin, class: "User" do
    email {Faker::Internet.email}
    password "1234567890"
    name {Faker::Name.name} 
    account_type 1
  end
end