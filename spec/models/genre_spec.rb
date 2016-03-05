require 'rails_helper'

RSpec.describe Genre, type: :model do
  let(:genre) {FactoryGirl.build(:genre)}

  describe "Validation" do
    it{expect(genre).to validate_presence_of(:name)}
  end

  describe "Relations" do 
    it{expect(genre).to have_many(:movies)}
  end
end
