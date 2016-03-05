require 'rails_helper'

RSpec.describe User, type: :model do

  [:user, :admin].each do |type|
    let(type) { FactoryGirl.build(type) }
  end

  describe "Validations" do
    #Basic validations
    it {expect(user).to validate_presence_of(:name)}
    it {expect(user).to validate_presence_of(:email)}
    it {expect(user).to validate_presence_of(:account_type)}

    #Account type validation
    it {expect(admin.admin?).to eq(true)}
    it {expect(user.user?).to eq(true)}
  end 
end
