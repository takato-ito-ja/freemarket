# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# README

## アプリケーション概要

- フリーマーケットアプリケーション


## アプリケーションの機能一覧

- Basic認証機能
- ユーザー新規登録機能
- ユーザーログイン／ログアウト機能
- マイページ表示機能
- 出品中／売却済商品表示機能
- クレジットカード登録
- 商品出品／編集／削除機能
- 商品購入機能

## アプリケーション内で使用している技術一覧
|種別|名称|
|------|----|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.0.7.2)|
|マークアップ|HTML(Haml),CSS(Sass)|
|フロントエンド|JavaScript(jQuery)|
|DB|MySQL|
|本番環境|AWS EC2|
|画像アップロード|carrierwave, AWS S3|
|自動デプロイ|capistrano|
|ユーザー管理|devise|
|クレジットカード管理|PayJP|

## DB設計
### usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|nickname|string|null: false
|first_name|string|null: false
|last_name|string|null: false
|first_name_kana|string|null: false
|last_name_kana|string|null: false
|phone_number|integer|null: false, unique: true|
|birthday|date|
#### Association
- has_many :products
- has_one :card
#### add_index
- add_index :email, unique: true
- add_index :reset_password_token, unique: true
### productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|buyed_time|timestamps||
|description|text|null: false|
|seller_id|references|null: false, foreign_key: { to_table: :users }|
|buyer_id|references|foreign_key: { to_table: :users }|
|brand_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
|area_id|references|foreign_key: true|
|price|integer|null: false|
|status|integer|null: false|
|payment_method|integer|null: false|
|payment_status|integer|null: false|
|sending_status|integer|null: false|
|recieving_status|integer|null: false|
|size|integer|null: false|
|condition|integer|null: false|
|postage_burden|integer|null: false|
|sending_methods|integer|null: false|
|scheduled_sending_date|integer|null: false|
#### Association
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- has_many :users
- belongs_to :category
- belongs_to :brand, optional: true
- belongs_to :area
### cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
#### Association
- belongs_to :user
### categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
#### Association
- has_many :products
### brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
#### Association
- has_many :products
### areasテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
#### Association
- has_many :products
### imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|foreign_key: true|
|image_url|text|
#### Association
- belongs_to :product
