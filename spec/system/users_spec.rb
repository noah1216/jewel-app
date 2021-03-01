require 'rails_helper'

RSpec.describe 'ユーザー新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
    @address_user = FactoryBot.build(:address_user)
  end
  context 'ユーザー新規登録ができるとき' do 
    it '正しい情報を入力すれば購入者の新規登録、住所登録ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('購入者会員登録')
      # 新規登録ページへ移動する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'nickname', with: @user.nickname
      fill_in 'email', with: @user.email
      fill_in 'password', with: @user.password
      fill_in 'password-confirmation', with: @user.password_confirmation
      fill_in 'last-name-kana', with: @user.family_n_k
      fill_in 'first-name-kana', with: @user.first_n_k
      fill_in 'last-name', with: @user.family_name
      fill_in 'first-name', with: @user.first_name
      fill_in 'text', with: @user.text
      # ネクストボタンを押すと住所情報入力ページへ遷移したことを確認する
      find('input[name="commit"]').click
      expect(page).to have_content('住所情報入力')
      # 住所情報を入力する
      fill_in 'postal-code', with: '333-3333'
      fill_in 'area', with: @address_user.area
      fill_in 'city', with: @address_user.city
      fill_in 'addresses', with: @address_user.block_number
      fill_in 'building', with: @address_user.house_number
      fill_in 'phone-number', with: @address_user.phone_number
      # ボタンを押すとユーザーモデルのカウントが1上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change { User.count }.by(1)
      # 保存完了ページに遷移する
      expect(page).to have_content('トップへ戻る')
      # トップページに遷移する
      visit root_path
      # ログアウトボタンが表示されることを確認する
      expect(page).to have_content('ログアウト')
      # サインアップページへ遷移するボタンや、ログインページへ遷移するボタンが表示されていないことを確認する
      expect(page).to have_no_content('購入者会員登録')
      expect(page).to have_no_content('購入者ログイン')
      expect(page).to have_no_content('出品者会員登録')
      expect(page).to have_no_content('出品者ログイン')
    end
  end
  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # トップページに移動する
      # トップページにサインアップページへ遷移するボタンがあることを確認する
      # 新規登録ページへ移動する
      # ユーザー情報を入力する
      # サインアップボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      # 新規登録ページへ戻されることを確認する
    end
  end
end