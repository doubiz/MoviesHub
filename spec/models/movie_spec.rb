require 'rails_helper'

RSpec.describe Movie, type: :model do
  [:movie, :movie_with_photos, ].each do |type|
    let(type) { FactoryGirl.build(type) }
  end
  let(:movie_with_ratings) { FactoryGirl.create(:movie_with_ratings) }

  describe "Validations" do
    it{expect(movie).to validate_presence_of(:name)}
  end

  describe "Relations" do
    it{expect(movie).to belong_to(:genre)}
  end

  describe "Rating" do
    it {expect(movie_with_ratings.rating).to eq(3.0)}
  end

  describe "Image uploading" do
    it "allows uploading photo via links" do
      movie.photo_url = "https://www.google.com.eg/images/nav_logo242.png"
      movie.save
      expect(movie.photo.file).to_not be_nil
    end

    it "allows uploading cover photo via links" do
      movie.cover_photo_url = "https://www.google.com.eg/images/nav_logo242.png"
      movie.save
      expect(movie.cover_photo.file).to_not be_nil
    end

    it "allows uploading photo via files" do
      movie.photo = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images','test.png'))
      movie.save
      expect(movie.photo.file).to_not be_nil
    end

    it "allows uploading cover photo via files" do
      movie.cover_photo = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images','test.png'))
      movie.save
      expect(movie.cover_photo.file).to_not be_nil
    end

  end
end
