class ProductImage < ApplicationRecord
  mount_uploader :main, ImageUploader
  belongs_to :product
end
