FactoryGirl.define do
  factory :team do
    name Faker::Team.creature
    production
  end
end
