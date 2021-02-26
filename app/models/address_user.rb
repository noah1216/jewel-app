class AddressUser < ApplicationRecord
  belongs_to :user, optional: true
  
  validates :postal_code, presence: true, format:{with: /\A\d{3}[-]\d{4}\z/}
  validates :postal_code, presence: true,format:{with: /\A\d{3}[-]\d{4}\z/}
	validates :area,presence: true
	validates :city,presence: true
	validates :block_number,presence: true
	validates :phone_number,presence: true, format:{with:/\A\d{11}\z/}
end
