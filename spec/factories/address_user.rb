FactoryBot.define do
  factory :address_user do
    postal_code { "333-3333" }
    area { '東京' }
    city { "浜田市" }
    block_number { "夕香の塔" }
    house_number { "309-11" }
    phone_number { "11111111111" }
    user_id { 1 }
    
    association :user
  end
end
