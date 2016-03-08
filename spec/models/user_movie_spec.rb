require 'rails_helper'

RSpec.describe UserMovie, type: :model do
  let(:user_movie) {FactoryGirl.create(:user_with_movie).user_movies.first}

  describe "Relations" do 
    it{expect(user_movie).to belong_to(:movie)}
    it{expect(user_movie).to belong_to(:user)}
  end
end
