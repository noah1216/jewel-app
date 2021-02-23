FactoryBot.define do
  factory :settlement do
    postal_code { "333-3333" }
    area { '東京' }
    city { "浜田市" }
    block_number { "夕香の塔" }
    house_number { "309-11" }
    phone_number { "11111111111" }
    user_id {1}
    item_id {1}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
