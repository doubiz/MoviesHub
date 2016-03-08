FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "1234567890"
    name "testing dude"
    account_type "user"

    trait :with_movie do
      after(:create) do |user|
        user.movies << create(:movie)
      end
    end
    factory :user_with_movie, traits: [:with_movie]
  end

  
  factory :admin, class: "User" do
    email "test@example.com"
    password "1234567890"
    name "testing admin"
    account_type 1
  end
end