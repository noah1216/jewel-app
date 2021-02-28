# JeweLinks

## アプリケーション概要
・ユーザー登録ができます。  
・ユーザーは購入者と出品者に分けて登録できます。  
・商品を出品できます。  
・商品を購入できます。  
・商品を検索することができます。  
・お気に入り機能があります。  
・マイページを閲覧できます。  
・コメントすることができます

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
宝石を愛しながら、高いと思っている方に価格差ピンからキリまであること、またいろいろな種類の宝石があることを知って欲しかったためです。
  
出品者側:宝石業界が衰退していっているため、もっと一般の方に知ってもらい業界市場を盛り上げたいと思い、宝石門アプリを作成しました。

## 実装した機能についてのGIFと説明
ユーザー登録は、購入者、出品者それぞれ分けて登録することが可能です。  
また、登録時は個人情報とともに住所情報も一緒に登録できます。  
![b15c215a9e5c41b8d1444c896d9eacc4](https://user-images.githubusercontent.com/76505928/109425361-3b2e3b00-7a2b-11eb-8513-b80d3ce1328e.gif)  
この時に登録した住所情報は購入時に発送先として呼び出すことができ、また、購入時に発送先を変更することも可能です。  
![e446cfd7a20946d9c8b47954d8951d35](https://user-images.githubusercontent.com/76505928/109425547-12f30c00-7a2c-11eb-92a0-1b2803efb4fa.gif)  
購入者には宝石について予備知識がなくとも簡単に商品が検索できるようカテゴリー検索機能を作成しました。  
![291155a32f0ba970c2b1825fbcbe458c](https://user-images.githubusercontent.com/76505928/109425738-1f2b9900-7a2d-11eb-9a5d-86ba7979198c.gif)  
購入者はお気に入り機能を使用できます。  
お気に入りしたものはマイページで確認できるようになっております。  
出品者は代わりに出品した商品を一覧として表示ができます。  
![7d5273e9d17a9c749fe4f6ff34890e53](https://user-images.githubusercontent.com/76505928/109425844-bd1f6380-7a2d-11eb-85c9-92211ee8b2ed.gif)
コメント機能により、出品者と商品について相談することが可能です。  
  
商品購入昨日はカードで購入が可能となっております。  




## 実装予定の機能
おすすめ機能

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
| text               | string  |             |


#### Association
- has_one :address_user
- has_many :orders
- has_many :favorites, dependent: :destroy  


### sellers テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| encrypted_password | string  | null: false |
| email              | string  | null: false, unique: true|
| nickname           | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| first_name_kana    | string  | null: false |
| family_name_kana   | string  | null: false |
| text               | string  |             |


#### Association
- has_one :address_seller
- has_many :items


### address_users テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| postal_code        | string  | null: false |
| area               | string  | null: false |
| city               | string  | null: false |
| block_number       | string  | null: false |
| house_number       | string  |             |
| phone_number       | string  | null: false |
| user               | references | null: false, foreign_key: true |


#### Association
- belongs_to :user, optional: true


### address_sellers テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| postal_code        | string  | null: false |
| area               | string  | null: false |
| city               | string  | null: false |
| block_number       | string  | null: false |
| house_number       | string  |             |
| phone_number       | string  | null: false |
| seller             | references | null: false, foreign_key: true |


#### Association
- belongs_to :seller, optional: true


### items テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| name               | string  | null: false |
| text               | string  | null: false |
| category_id        | integer | null: false |
| state_id           | integer | null: false |
| area_id            | integer | null: false |
| shopping_fee_id    | integer | null: false |
| shopping_day_id    | integer | null: false |
| price              | integer | null: false |
| seller             | references  | null: false, foreign_key: true |


#### Association
- belongs_to :category
- belongs_to :state
- belongs_to :shopping_fee
- belongs_to :shopping_day
- belongs_to :area

- belongs_to :seller
- has_one :order
- has_one_attached :image
- has_many :favorites, dependent: :destroy


### orders テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |



#### Association
- belongs_to :user
- belongs_to :item


### address_shippings テーブル
| Column             | Type    | Options     |
| ------------------ | ------  | ----------- |
| postal_code        | string  | null: false |
| area               | string  | null: false |
| city               | string  | null: false |
| block_number       | string  | null: false |
| house_number       | string  |             |
| phone_number       | string  | null: false |
| order              | references | null: false, foreign_key: true |


#### Association
- belongs_to :order


### favorites テーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


#### Association
- belongs_to :user
- belongs_to :item


*2020/2/27追加
### comments テーブル
| Column             | Type     | Options     |
| ------------------ | -------- | ----------- |
| text               | string   | null: false |
| user_id            | integer  |             |
| seller_id          | integer  |             |
| item               | references  | foreign_key: true |


#### Association

- belongs_to :item
- belongs_to :user , optional: true
- belongs_to :seller, optional: true


## ローカルでの動作方法
開発環境  
Ruby/Ruby on Rails/MySQL/Github/(AWS)

