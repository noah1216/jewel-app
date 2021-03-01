FactoryBot.define do
  factory :comment do
    text { 'ラグナロク' }
    user_id { 1 }
    seller_id { 1 }
    item_id { 1 }

    association :item
  end
end
