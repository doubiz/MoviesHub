require 'rails_helper'

RSpec.describe Users::SessionsController, type: :request do
  describe "Authenticate user" do
    let(:user) { FactoryGirl.build(:user) }

    it "should return a token on successful user sign in" do
      user = FactoryGirl.create(:user)
      post "/api/v1/users/sign_in", user: {email: user.email, password: "1234567890"}
      auth_token = JSON.parse(response.body)["authentication_token"]
      expect(response.status).to eq(200)
      body_from_token = Devise.token_generator.digest(AuthenticationToken, :body, auth_token)
      user_id_from_token = AuthenticationToken.find_by_body(body_from_token).user_id
      expect(user_id_from_token).to eq(user.id) 
    end
  end
end
