FactoryGirl.define do
  factory :company do
    name "#{Faker::Ancient.hero} Theatre"
    location Faker::Address.city
    logo_url Faker::Placeholdit.image
  end
end
