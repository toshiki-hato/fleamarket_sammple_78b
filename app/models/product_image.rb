class ProductImage < ApplicationRecord
  validates :main, presence: true
  belongs_to :product
end
