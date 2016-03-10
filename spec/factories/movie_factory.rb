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
    trait :with_photos do
      photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images','test.png')) }
      cover_photo { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images','test.png')) }
    end
    trait :with_link_photos do
      photo_url "https://www.google.com.eg/images/nav_logo242.png"
      cover_photo_url "https://www.google.com.eg/images/nav_logo242.png"
    end

    factory :movie_with_ratings, traits: [:with_ratings]
    factory :movie_with_photos, traits: [:with_photos]
    factory :movie_with_link_photos, traits: [:with_link_photos]
  end

end
