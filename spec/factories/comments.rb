FactoryBot.define do
  factory :user_comment do
    association :character
    association :user
    person_name { Faker::Name.name }
    comment { Faker::Lorem.paragraph }
    rating { rand(1..5) }
  end
end
