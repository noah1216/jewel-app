FactoryBot.define do
  factory :item do
    name { 'ラグナロク' }
    text { 'ラグナロク' }
    category_id { 1 }
    state_id { 1 }
    area_id { 1 }
    shopping_fee_id { 1 }
    shopping_day_id { 1 }
    price { 3000 }
    image { Faker::Lorem.sentence }

    association :seller

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
