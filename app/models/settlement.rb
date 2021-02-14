class Settlement
    
  include ActiveModel::Model
  attr_accessor :postal_code, :area, :city, :block_number, :house_number, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code, format:{with: /\A\d{3}[-]\d{4}\z/}
    validates :area
    validates :city
    validates :block_number
    validates :phone_number, format:{with:/\A\d{11}\z/}
    validates :user_id
    validates :item_id
  end
    
  def save
    sum = Order.create(user_id: user_id, item_id: item_id)
    AddressShipping.create(postal_code: postal_code, area: area, city: city, house_number: house_number, block_number: block_number, phone_number: phone_number, order_id: sum.id)
  end
end