FactoryBot.define do
  factory :post do
    shop_name { Faker::Lorem.characters(number: 10) }
    body { Faker::Lorem.characters(number: 30) }
  end
end
