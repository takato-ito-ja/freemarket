class Product < ApplicationRecord

  has_many :images, dependent: :destroy
  has_many :comments
  has_many :users
  has_one :seller_evaluation
  has_one :buyer_evaluation
  belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :area

  validates :name,                    presence: true
  validates :description,             presence: true
  validates :category_id,             presence: true
  validates :category,                presence: true
  validates :price,                   presence: true
  validates :condition,               presence: true
  validates :sending_methods,         presence: true
  validates :status,                  presence: true
  validates :area_id,                 presence: true
  validates :sending_status,          presence: true
  validates :fee_payer,               presence: true
  validates :scheduled_sending_date,  presence: true
  validates :postage_burden,          presence: true
  validates :payment_method,          presence: true
  validates :payment_status,          presence: true
  validates :recieving_status,        presence: true

  enum size: { XS以下: 1, S: 2, M: 3, L: 4, XL: 5, XL以上: 6, FREE_SIZE: 7}
  enum condition: { 新品、未使用: 1, 未使用に近い: 2, 目立った傷や汚れなし: 3, やや傷や汚れあり: 4, 傷や汚れあり: 5, 全体的に状態が悪い: 6}
  enum postage_burden: { "送料込み(出品者負担)": 1, "着払い(購入者負担)": 2}
  enum sending_methods: { "未定": 1, "らくらくメルカリ便": 2, "ゆうメール": 3, "レターパック": 4, "普通郵便(定形、定形外)": 5, "クロネコヤマト": 6, "ゆうパック": 7, "クリックポスト": 8, "ゆうパケット": 9}
  enum scheduled_sending_date: { "1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}
  
  def self.search(search)
    return Product.all unless search
    Product.where(['name LIKE ?', "%#{search}%"])
  end

end
