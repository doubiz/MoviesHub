FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "1234567890"
    name "testing dude"
    account_type "user"
  end
  
  factory :admin, class: "User" do
    email "test@example.com"
    password "1234567890"
    name "testing admin"
    account_type "admin"
  end
end