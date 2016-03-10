require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do

  describe "POST #create" do
    it "should create a user" do
      post "/api/v1/users", user: FactoryGirl.attributes_for(:user)
      expect(response.status).to eq(200)
      res = JSON.parse(response.body)
      user_json = res["user"]
      auth_token = res["authentication_token"]
      expect(auth_token).to_not be_nil
      expect(User.find user_json["id"]).to be_persisted 
    end

    it "should allow user creation with avatar link" do
      post "/api/v1/users", user: FactoryGirl.attributes_for(:user_with_link_avatar)
      expect(response.status).to eq(200)
      res = JSON.parse(response.body)
      expect(res["user"]["avatar"]["url"]).to_not be_nil
    end

    it "should allow user creation with avatar file" do
      post "/api/v1/users", user: FactoryGirl.attributes_for(:user_with_avatar)
      expect(response.status).to eq(200)
      res = JSON.parse(response.body)
      expect(res["user"]["avatar"]["url"]).to_not be_nil
    end
  end
end
