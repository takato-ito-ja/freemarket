class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  
    # validation
    validates :nickname, length: { in: 1..15, message: 'は1〜15文字で記入してください'}, presence: true
    validates :email, length: { maximum: 50, too_long: 'は50文字以内で記入してください'}, presence: true, format: { with: /\A\S+@\S+\.\S+\z/, message: "は「***@***.***」で登録してください"}
    validates_uniqueness_of :email, message: 'は既に登録されています' 
    validates :password, length: { in: 6..15, message: '6〜15文字で記入してください'}, presence: true
    validates :last_name, presence: true
    validates :first_name, presence: true
    validates :last_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ , message: "は全角カタカナで登録してください"}
    validates :first_name_kana, presence: true, format: { with: /\A[ぁ-んァ-ヶー－]+\z/ , message: "は全角カタカナで登録してください"}
    validates :phone_number, length: { in: 10..11, message: 'は10,11文字で記入してください'}, presence: true
    validates_uniqueness_of :phone_number, message: 'は既に登録されています'
  
    # associate
    has_many :products
    has_one :card
end
