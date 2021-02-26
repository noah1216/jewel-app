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

    # context '商品購入できないとき' do
    #   it '郵便番号が空では登録できない' do
    #     @address_seller.postal_code = ''
    #     @address_seller.valid?
    #     expect(@address_seller.errors.full_messages).to include()
    #   end
    # end
    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @address_seller.postal_code = ''
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it '郵便番号にはハイフンがないと登録できない' do
        @address_seller.postal_code = "3333333"
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空では登録できない' do
        @address_seller.area = ''
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空では登録できない' do
        @address_seller.city = ''
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @address_seller.block_number = ''
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号が空では登録できない' do
        @address_seller.phone_number = ''
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it '電話番号にハイフンがあると登録できない' do
        @address_seller.phone_number = '000-0000-0000'
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11文字より多いと登録できない' do
        @address_seller.phone_number = "666666666666"
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が全角数字だと登録できない' do
        @address_seller.phone_number = "０００００００００００"
        @address_seller.valid?
        expect(@address_seller.errors.full_messages).to include("Phone number is invalid")
      end
      # it 'user_idが空では登録できない' do
      #   @address_seller.user_id = ''
      #   @address_seller.valid?
      #   expect(@address_seller.errors.full_messages).to include("User can't be blank")
      # end
      # it 'item_idが空では登録できない' do
      #   @address_seller.item_id = ''
      #   @address_seller.valid?
      #   expect(@address_seller.errors.full_messages).to include("Item can't be blank")
      # end
    end
  end
end