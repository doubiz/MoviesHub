require 'rails_helper'

RSpec.describe Movie, type: :model do
  let(:movie) {FactoryGirl.build(:movie)}

  describe "Validations" do
    it{expect(movie).to validate_presence_of(:name)}
  end

  describe "Relations" do
    it{expect(movie).to belong_to(:genre)}
  end
end
