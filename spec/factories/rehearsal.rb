FactoryGirl.define do
  factory :rehearsal do
    date Time.now.to_s
    location "#{Faker::Ancient.god} Theatre"
    production
  end
end
