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
end
