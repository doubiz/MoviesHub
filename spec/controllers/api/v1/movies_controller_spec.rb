require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :request do
  let(:movie) {FactoryGirl.create(:movie)}

  describe "GET #index" do
    it "should return a movies array" do
      movie = FactoryGirl.create(:movie)
      get "/api/v1/movies"
      expect(assigns(:movies)).to include(movie)
    end
  end

  describe "GET #show" do
    it "should return a movie" do
      get "/api/v1/movies/#{movie.id}"
      expect(assigns(:movie)).to eq(movie)
    end
  end

  describe "POST #create" do
    it "creates a new movie" do
      expect{
        post_with_token :admin, "/api/v1/movies", movie: FactoryGirl.attributes_for(:movie)
      }.to change(Movie,:count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates a movie" do
      put_with_token :admin, "/api/v1/movies/#{movie.id}", 
        movie: FactoryGirl.attributes_for(:movie, name: "Super test")
      movie.reload
      expect(movie.name).to eq("Super test")
    end
  end

  describe "Delete #destroy" do
    it "deletes a movie" do
      movie = FactoryGirl.create(:movie)
      expect{
        delete_with_token :admin, "/api/v1/movies/#{movie.id}"
      }.to change(Movie,:count).by(-1)
    end
  end
end
