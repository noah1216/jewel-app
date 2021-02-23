FactoryBot.define do
  factory :address_seller do
    postal_code { "333-3333" }
    area { '東京' }
    city { "浜田市" }
    block_number { "夕香の塔" }
    house_number { "309-11" }
    phone_number { "11111111111" }
    seller_id { 1 }
    
  end
end
