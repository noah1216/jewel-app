

require 'rails_helper'

RSpec.describe AddressSeller, type: :model do
  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      address_seller = AddressSeller.new(postal_code: '', area: 'ここ', city: 'ここ', block_number: 'ここ', phone_number: '11111111111')
        address_seller.valid?
        expect(address_seller.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end
  end
end