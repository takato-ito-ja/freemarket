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
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false, default: ""|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|null: false|
|reset_password_sent_at|datetime|null: false|
|remember_created_at|datetime|null: false|
|nickname|string|null: false, limit: 50|
|first_name|string|null: false, limit: 50|
|last_name|string|null: false, limit: 50|
|first_name_kana|string|null: false, limit: 50|
|last_name_kana|string|null: false, limit: 50|
|phone_number|integer|null: false,limit: 50, unique: true|
|birthday|date|null: false|
|icon|text||
|introduction|text||
### Association
- has_many :products
- has_many :comments
- has_one :user_address
- has_one :credit_card
- accepts_nested_attributes_for :user_address
### add_index
- add_index :email, unique: true
- add_index :reset_password_token, unique: true
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_id|references|null: false, foreign_key: { to_table: :users }|
|name|string|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|foreign_key: true|
|price|integer|null: false|
|description|text|null: false|
|condition|references|null: false, foreign_key: true|
|postage_burden|integer|null: false|
|area_id|references|null: false, foreign_key: true|
|scheduled_sending_date|integer|null: false|
|size|references|foreign_key: true|
|status|integer|null: false|
|buyer_id|references|foreign_key: { to_table: :users }|
|buyed_time|timestamps||
|payment_method|integer|null: false|
|payment_status|integer|null: false|
|sending_status|integer|null: false|
|recieving_status|integer|null: false|
|sending_methods|integer|null: false|

### Association
- has_many :images, dependent: :destroy
- accepts_nested_attributes_for :images, allow_destroy: true
- has_many :comments
- has_many :users
- has_one :seller_evaluation
- has_one :buyer_evaluation
- belongs_to :category
- belongs_to :brand, optional: true
- belongs_to :area
- belongs_to :postage_burden
- belongs_to :scheduled_sending_date
## postage_burdensテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
## scheduled_sending_datesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string||
### Association
- has_many :products
### add_index
- add_index :ancestry
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
## areasテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
- has_many :user_addresses
- has_many :identity_informations
### add_index
- add_index :areas, unique: true, length: 10
## user_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|first_name|string|null: false, limit: 50|
|last_name|string|null: false, limit: 50|
|first_name_kana|string|null: false, limit: 50|
|last_name_kana|string|null: false, limit: 50|
|postal_code|integer|null: false|
|area_id|references|foreign_key: true|
|city|string|null: false, limit: 20|
|address|string|null: false, limit: 20|
|building|string|limit: 50|
|phone_number|string|limit: 11|
### Association
- belongs_to :area
## identity_informationsテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer||
|area_id|references|foreign_key: true|
|city|string||
|address|string||
|building|string||
### Association
belongs_to :area
## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|body|text|null: false|
### Association
- belongs_to :product
- belongs_to :user
## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product_id|references|null: false, foreign_key: true|
|image_url|text|null: false|
### Association
- belongs_to :product
