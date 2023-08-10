# spec/factories/characters.rb
FactoryBot.define do
  factory :character do
    name { Faker::Name.name }
    status { 'alive' }
    species { 'human' }
    gender { 'male' }
    origin_name { Faker::Lorem.word }
    origin_url { Faker::Internet.url }
    location_name { Faker::Lorem.word }
    location_url { Faker::Internet.url }
    image { Faker::Internet.url }
    created { Faker::Date.backward(days: 100) }
    association :user

    trait :main do
      type { 'main' }
    end
  end
end
