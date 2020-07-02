class ProductImage < ApplicationRecord
  validates :main, presence: true
  mount_uploader :main, ImageUploader
  belongs_to :product
end
