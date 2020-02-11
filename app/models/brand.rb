class Brand < ApplicationRecord
  has_many :products
  has_many :ctegories
end
