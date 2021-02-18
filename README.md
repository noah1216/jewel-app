# JeweLinks

## アプリケーション概要
・ユーザー登録ができます。  
・ユーザーは購入者と出品者に分けて登録できます。  
・商品を出品できます。  
・商品を購入できます。  
・商品を検索することができます。  
・お気に入り機能があります。  
・マイページを閲覧できます。  

## URL
https://jewel-33511.herokuapp.com/

## テスト用アカウント等
### ID/Pass
ID: noah  
Pass: 1111  

### テスト用アカウント
##### 購入者用  
メールアドレス: joshua@joshua123456a  
パスワード: 123456a  
購入用カード情報  
番号：4242424242424242  
期限：Wed Mar 01 2023 00:00:00 GMT+0900 (日本標準時)  
セキュリティコード：123  
##### 出品者用  
メールアドレス名:  noah@noah123456a  
パスワード: 123456a  


## 利用方法
商品を購入をしたい場合はまず購入者登録からユーザー登録を、  
商品を出品する企業やお店などの方は出品者登録からユーザー登録をお願いいたします。  
購入者は商品購入、お気に入り機能、マーページ編集機能、商品検索をすることができます。  
出品者は商品出品機能、マイページ編集機能、商品検索をすることができます。  

## 目指した課題解決
購入者側：宝石を身近なものとして知って欲しいと思いました。  
宝石を愛しながら、高いと思っている方に価格差がかなりあること、またいろいろな種類の宝石があることを知って欲しかったためです。
  
出品者側:宝石業界が衰退していっているため、もっと一般の方に知ってもらい業界市場を盛り上げたいと思い、宝石門アプリを作成しました。
## 洗い出した要件
#### 検索機能（カテゴリー検索）
#### ブックマーク、お気に入り
#### 購入機能
#### 購入者と販売者で登録ページの変更
#### 商品出品機能
#### マイページ

## 実装した機能についてのGIFと説明

## 実装予定の機能
・ユーザーのフォロー機能

## データベース設計
### users テーブル

| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| encrypted_password | string  | null: false |
| email              | string  | null: false, unique: true|
| nickname           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| first_name_kana    | string  | null: false |
| family_name_kana   | string  | null: false |
| birthday           | date    | null: false |

#### Association
- has_one :address_user
- has_many :orders
- has_many :favorites, dependent: :destroy  


## ローカルでの動作方法
開発環境  
Ruby/Ruby on Rails/MySQL/Github/(AWS)

