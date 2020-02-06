class Image < ApplicationRecord
  mount_uploader :image_url, ImageUploader
  belongs_to :product, optional: true
end
