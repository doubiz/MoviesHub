require 'rails_helper'

RSpec.describe Api::V1::GenresController, type: :request do
  let(:genre) {FactoryGirl.create(:genre)}

  describe "GET #index" do
    it "should return a genres array" do
      genre = FactoryGirl.create(:genre)
      get "/api/v1/genres"
      expect(assigns(:genres)).to include(genre)
    end
  end

  describe "POST #create" do
    it "creates a new genre" do
      expect{
        post_with_token :admin, "/api/v1/genres", genre: FactoryGirl.attributes_for(:genre)
      }.to change(Genre,:count).by(1)
    end
  end

  describe "PUT #update" do
    it "updates a genre" do
      put_with_token :admin, "/api/v1/genres/#{genre.id}", 
        genre: FactoryGirl.attributes_for(:genre, name: "Super test")
      genre.reload
      expect(genre.name).to eq("Super test")
    end
  end

  describe "Delete #destroy" do
    it "deletes a genre" do
      genre = FactoryGirl.create(:genre)
      expect{
        delete_with_token :admin, "/api/v1/genres/#{genre.id}"
      }.to change(Genre,:count).by(-1)
    end
  end
end
