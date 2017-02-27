FactoryGirl.define do
  factory :membership do
    role Faker::Name.title
    user
    team
  end
end
