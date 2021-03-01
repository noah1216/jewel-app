require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe '商品出品' do
    context '商品が投稿できる場合' do
      it '全ての項目の入力が存在すれば投稿できる' do
        expect(@comment).to be_valid
      end
      it 'user_idがnilでも投稿できる' do
        @comment.user_id = nil
        expect(@comment).to be_valid
      end
      it 'seller_idがnilでも投稿できる' do
        @comment.seller_id = nil
        expect(@comment).to be_valid
      end
    end

    context '商品が投稿できない場合' do
      it '画像が添付されてないと投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
