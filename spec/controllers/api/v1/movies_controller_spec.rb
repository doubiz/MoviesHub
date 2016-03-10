require 'rails_helper'

RSpec.describe Api::V1::MoviesController, type: :request do
  let(:movie) {FactoryGirl.create(:movie)}
  let(:genre) {FactoryGirl.create(:genre)}

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
        post_with_token :admin, "/api/v1/movies", movie: FactoryGirl.attributes_for(:movie).merge({genre_id: genre.id})
      }.to change(Movie,:count).by(1)
    end

    it "create a new movie with photo links" do
      post_with_token :admin, "/api/v1/movies", movie: FactoryGirl.attributes_for(:movie_with_link_photos).merge({genre_id: genre.id})
      res = JSON.parse(response.body)
      expect(res["cover_photo"]["url"]).to_not be_nil
      expect(res["photo"]["url"]).to_not be_nil
    end

    it "create a new movie with photo files" do
      post_with_token :admin, "/api/v1/movies", movie: FactoryGirl.attributes_for(:movie_with_photos).merge({genre_id: genre.id})
      res = JSON.parse(response.body)
      expect(res["cover_photo"]["url"]).to_not be_nil
      expect(res["photo"]["url"]).to_not be_nil
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
