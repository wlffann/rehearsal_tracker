FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    email Faker::Internet.email
    image_url Faker::Placeholdit.image
    slack_name Faker::Internet.user_name
  end
end
