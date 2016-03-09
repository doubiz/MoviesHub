require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) {FactoryGirl.build(:movie)}

  describe "Validations" do
    it{expect(movie).to validate_presence_of(:name)}
  end

  describe "Relations" do
    it{expect(movie).to belong_to(:genre)}
  end

  describe "Rating" do
    let(:movie_with_ratings) {FactoryGirl.create(:movie_with_ratings)}
    it {expect(movie_with_ratings.rating).to eq(3.0)}
  end
end
