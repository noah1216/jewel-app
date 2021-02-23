require 'rails_helper'

RSpec.describe Settlement, type: :model do
  describe '#create' do
    before do
      @settlement = FactoryBot.build(:settlement)
    end

    context '商品購入できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@settlement).to be_valid
      end
      it '建物名が存在しなくても登録できること' do
        @settlement.house_number = ""
        expect(@settlement).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号が空では登録できない' do
        @settlement.postal_code = ''
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
      end
      it '郵便番号にはハイフンがないと登録できない' do
        @settlement.postal_code = "3333333"
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空では登録できない' do
        @settlement.area = ''
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Area can't be blank")
      end
      it '市区町村が空では登録できない' do
        @settlement.city = ''
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では登録できない' do
        @settlement.block_number = ''
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Block number can't be blank")
      end
      it '電話番号が空では登録できない' do
        @settlement.phone_number = ''
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it '電話番号にハイフンがあると登録できない' do
        @settlement.phone_number = '000-0000-0000'
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11文字より多いと登録できない' do
        @settlement.phone_number = "666666666666"
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が全角数字だと登録できない' do
        @settlement.phone_number = "０００００００００００"
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Phone number is invalid")
      end
      it "tokenが空では登録できないこと" do
        @settlement.token = nil
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できない' do
        @settlement.user_id = ''
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @settlement.item_id = ''
        @settlement.valid?
        expect(@settlement.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
