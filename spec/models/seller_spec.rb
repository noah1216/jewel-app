require 'rails_helper'

RSpec.describe Seller, type: :model do
  describe '#create' do
    before do
      @seller = FactoryBot.build(:seller)
    end

    context '新規登録できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@seller).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @seller.password = '00000a'
        @seller.password_confirmation = '00000a'
        expect(@seller).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @seller.nickname = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @seller.email = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @seller.save
        a_seller = FactoryBot.build(:seller)
        a_seller.email = @seller.email
        a_seller.valid?
        expect(a_seller.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれてなければ登録できない' do
        @seller.email = 'aaaaaaa'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @seller.password = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @seller.password_confirmation = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @seller.password = '0000a'
        @seller.password_confirmation = '0000a'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけでは登録できない' do
        @seller.password = '111111'
        @seller.password_confirmation = '111111'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードとパスワード(確認用)が一致しないと登録できない' do
        @seller.password = '000000000a'
        @seller.password_confirmation = '10000a'
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @seller.password = 'aaaaaa'
        @seller.password_confirmation = 'aaaaaa'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角の場合は登録できない' do
        @seller.password = 'mmmmmm'
        @seller.password_confirmation = 'mmmmmm'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('Password is invalid')
      end
      it 'ユーザーの本名（苗字）が空では登録できない' do
        @seller.family_name = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
      end
      it 'ユーザーの本名（苗字）が全角以外（漢字・ひらがな・カタカナ）では登録できない' do
        @seller.family_name = 'hihihiuuu'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('Family name is invalid')
      end
      it 'ユーザーの本名（名前）が空では登録できない' do
        @seller.first_name = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'ユーザーの本名（名前）が全角以外（漢字・ひらがな・カタカナ）では登録できない' do
        @seller.first_name = 'hihihiuuu'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザーの本名（苗字）のフリガナが空では登録できない' do
        @seller.family_n_k = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("Family n k can't be blank", 'Family n k is invalid')
      end
      it 'ユーザーの本名（苗字）のフリガナがフリガナ以外では登録できない' do
        @seller.family_n_k = 'もここ位置f'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('Family n k is invalid')
      end
      it 'ユーザーの本名（名前）のフリガナが空では登録できない' do
        @seller.first_n_k = ''
        @seller.valid?
        expect(@seller.errors.full_messages).to include("First n k can't be blank", 'First n k is invalid')
      end
      it 'ユーザーの本名（名前）のフリガナがフリガナ以外では登録できない' do
        @seller.first_n_k = 'もここ位置f'
        @seller.valid?
        expect(@seller.errors.full_messages).to include('First n k is invalid')
      end
    end
  end
end
