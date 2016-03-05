FactoryGirl.define do
  factory :movie do
    name "Mysterious Ruby Movie"
    duration "120"
    release_date Date.today
  end
end
