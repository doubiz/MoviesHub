require 'rails_helper'

RSpec.describe Rating, type: :model do
  let(:user) {FactoryGirl.create(:user)}
  let(:movie) {FactoryGirl.create(:movie)}
  let(:rating) {FactoryGirl.create(:rating, user_id: user.id, movie_id: movie.id, value: 4)}
  
  describe "Validations" do
    #Basic validations
    it {expect(rating).to validate_presence_of(:user_id)}
    it {expect(rating).to validate_presence_of(:movie_id)}
    it {expect(rating).to validate_presence_of(:value)}

    #Uniquniess validations
    it "should validate uniquniess of rating per user per movie" do
      rating
      dup_rating = FactoryGirl.build(:rating, user_id: user.id, movie_id: movie.id, value: 4)
      expect(dup_rating).to be_invalid
    end
  end 
end
