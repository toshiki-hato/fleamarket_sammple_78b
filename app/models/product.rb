class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :product_images, dependent: :destroy
  accepts_nested_attributes_for :product_images, allow_destroy: true

  belongs_to :user
  belongs_to :category

  validates :name,              length: { maximum: 40 }, presence: true
  validates :description,       length: { maximum: 1000 }, presence: true
  validates :price,             numericality: { only_integr: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :status,            presence: true
  validates :shipping_expenses, presence: true
  validates :send_from,         presence: true
  validates :lead_time,         presence: true
  validates_associated :product_images
  validates :product_images, presence: true
end
