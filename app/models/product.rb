class Product < ApplicationRecord

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  has_many :users
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :area
  validates :name,                    presence: true
  validates :description,             presence: true
  validates :category_id,             presence: true
  validates :price,                   presence: true
  validates :condition,               presence: true
  validates :sending_method,          presence: true
  validates :status,                  presence: true
  validates :area_id,                 presence: true
  validates :sending_status,          presence: true
  validates :scheduled_sending_date,  presence: true
  validates :postage_burden,          presence: true
  validates :payment_status,          presence: true
  validates :recieving_status,        presence: true

  enum size: [:"XS以下", :"S", :"M", :"L", :"XL",:"XL以上",:"FREE_SIZE"]
  enum condition: [ :"新品、未使用", :"未使用に近い", :"目立った傷や汚れなし",:"やや傷や汚れあり",:"傷や汚れあり", :"全体的に状態が悪い"]
  enum postage_burden: [:"送料込み(出品者負担)" ,:"着払い(購入者負担)"]
  enum sending_method:[:"未定",:"らくらくメルカリ便", :"ゆうメール"]
  enum scheduled_sending_date: [:"1~2日で発送", :"2~3日で発送",:"4~7日で発送"]

end
