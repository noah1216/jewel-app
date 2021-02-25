require 'rails_helper'

RSpec.describe AddressSeller, type: :model do
  describe '#create' do
    before do
      @address_seller = FactoryBot.build(:address_seller)
    end

    context '商品購入できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@address_seller).to be_valid
      end
      it '建物名が存在しなくても登録できること' do
        @address_seller.house_number = ""
        expect(@address_seller).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @address_seller.postal_code = ''
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include()
      end
    end
  end
end