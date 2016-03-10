require 'rails_helper'

RSpec.describe User, type: :model do

  [:user, :admin, :user_with_movie].each do |type|
    let(type) { FactoryGirl.build(type) }
  end

  describe "Validations" do
    #Basic validations
    it {expect(user).to validate_presence_of(:name)}
    it {expect(user).to validate_presence_of(:email)}
    it {expect(user).to validate_presence_of(:account_type)}

    #Account type validation
    it {expect(admin.admin?).to eq(true)}
    it {expect(user.user?).to eq(true)}

    #Relations
    it {expect(user).to have_many(:not_watched_movies)}
    it {expect(user).to have_many(:liked_movies)}
    it {expect(user).to have_many(:disliked_movies)}
  end

  describe "Avatar uploading" do
    it "allows uploading avatar via links" do
      user.avatar_url = "https://www.google.com.eg/images/nav_logo242.png"
      user.save
      expect(user.avatar.file).to_not be_nil
    end

    it "allows uploading avatar via files" do
      user.avatar = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'images','test.png'))
      user.save
      expect(user.avatar.file).to_not be_nil
    end
  end
end
