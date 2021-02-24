require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が投稿できる場合' do
      it '全ての項目の入力が存在すれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が投稿できない場合' do
      it '画像が添付されてないと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では投稿できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'テキストが空では投稿できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'カテゴリーが空では投稿できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'カテゴリーが0では投稿できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 0')
      end
      it '商品状態が空では投稿できない' do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('State is not a number')
      end
      it '商品状態が0では投稿できない' do
        @item.state_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 0')
      end
      it '発送料負担が空では投稿できない' do
        @item.shopping_fee_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping fee is not a number')
      end
      it '発送料負担が0では投稿できない' do
        @item.shopping_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping fee must be other than 0')
      end
      it '発送元地域が空では投稿できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Area is not a number')
      end
      it '発送元地域が0では投稿できない' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Area must be other than 0')
      end
      it '発送日時が空では投稿できない' do
        @item.shopping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping day is not a number')
      end
      it '発送日時が0では投稿できない' do
        @item.shopping_day_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping day must be other than 0')
      end
      it '価格が空では投稿できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円以下だと投稿できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が9999999円以上だと投稿できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '価格が全角文字では登録できないこと' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が半角英数混合では登録できないこと' do
        @item.price = '113u333'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it '価格が半角英語だけでは登録できないこと' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @item.seller = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Seller must exist')
      end
    end
  end
end
