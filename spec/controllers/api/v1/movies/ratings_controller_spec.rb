require 'rails_helper'

RSpec.describe Api::V1::Movies::RatingsController, type: :request do
  let(:user) {FactoryGirl.create(:user)}
  let(:movie) {FactoryGirl.create(:movie)}
  let(:rating) {FactoryGirl.create(:rating, user_id: user.id, movie_id: movie.id, value: 4)}

  describe "POST #create" do
    it "creates a new rating" do
      expect{
        post_with_token :admin, "/api/v1/movies/ratings", rating: {user_id: user.id, movie_id: movie.id, value: 4}
      }.to change(Rating,:count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates a rating" do
      put_with_token :admin, "/api/v1/movies/ratings/#{rating.id}", 
        rating: FactoryGirl.attributes_for(:rating, value: 5)
      rating.reload
      expect(rating.value).to eq(5)
    end
  end

  describe "Delete #destroy" do
    it "deletes a rating" do
      rating = FactoryGirl.create(:rating, user_id: user.id, movie_id: movie.id, value: 4)
      expect{
        delete_with_token :admin, "/api/v1/movies/ratings/#{rating.id}"
      }.to change(Rating,:count).by(-1)
    end
  end
end
