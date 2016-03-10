require 'rails_helper'

RSpec.describe Api::V1::Movies::UserMoviesController, type: :request do
  let(:user) {FactoryGirl.create(:user)}
  let(:movie) {FactoryGirl.create(:movie)}
  let(:user_movie) {FactoryGirl.create(:user_movie, user_id: user.id, movie_id: movie.id, state: "not_watched")}

  describe "POST #create" do
    it "Adds a new movie to the user" do
      expect{
        post_with_token user, "/api/v1/movies/user_movies", user_movie: {user_id: user.id, 
          movie_id: FactoryGirl.create(:movie).id, value: "not_watched"}
      }.to change(user.movies,:count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates a user movie" do
      user_movie
      put_with_token user, "/api/v1/movies/user_movies/#{movie.id}", 
        user_movie: {state: "liked"}
      user_movie.reload
      expect(user_movie.state).to eq("liked")
    end
  end

  describe "Delete #destroy" do
    it "deletes a user movie" do
      user_movie
      expect{
        delete_with_token user, "/api/v1/movies/user_movies/#{movie.id}"
      }.to change(user.movies,:count).by(-1)
    end
  end
end
