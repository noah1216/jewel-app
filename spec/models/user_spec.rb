require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '00000a'
        @user.password_confirmation = '00000a'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        a_user = FactoryBot.build(:user)
        a_user.email = @user.email
        a_user.valid?
        expect(a_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれてなければ登録できない' do
        @user.email = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '0000a'
        @user.password_confirmation = '0000a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが数字だけでは登録できない' do
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードとパスワード(確認用)が一致しないと登録できない' do
        @user.password = '000000000a'
        @user.password_confirmation = '10000a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみの場合は登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角の場合は登録できない' do
        @user.password = 'mmmmmm'
        @user.password_confirmation = 'mmmmmm'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'ユーザーの本名（苗字）が空では登録できない' do
        @user.family_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
      end
      it 'ユーザーの本名（苗字）が全角以外（漢字・ひらがな・カタカナ）では登録できない' do
        @user.family_name = 'hihihiuuu'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family name is invalid')
      end
      it 'ユーザーの本名（名前）が空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
      end
      it 'ユーザーの本名（名前）が全角以外（漢字・ひらがな・カタカナ）では登録できない' do
        @user.first_name = 'hihihiuuu'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザーの本名（苗字）のフリガナが空では登録できない' do
        @user.family_n_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family n k can't be blank", 'Family n k is invalid')
      end
      it 'ユーザーの本名（苗字）のフリガナがフリガナ以外では登録できない' do
        @user.family_n_k = 'もここ位置f'
        @user.valid?
        expect(@user.errors.full_messages).to include('Family n k is invalid')
      end
      it 'ユーザーの本名（名前）のフリガナが空では登録できない' do
        @user.first_n_k = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First n k can't be blank", 'First n k is invalid')
      end
      it 'ユーザーの本名（名前）のフリガナがフリガナ以外では登録できない' do
        @user.first_n_k = 'もここ位置f'
        @user.valid?
        expect(@user.errors.full_messages).to include('First n k is invalid')
      end
    end
  end
end
