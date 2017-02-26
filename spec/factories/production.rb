FactoryGirl.define do
  factory :production do
    title Faker::Book.title
    season "Spring 2016"
    logo_url Faker::LoremPixel.image
    company
  end
end
