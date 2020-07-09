class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_many :product_images
  accepts_nested_attributes_for :product_images, allow_destroy: true

  #belongs_to :user
  belongs_to :category
  has_one :purchase

  validates :name,              presence: true
  validates :description,       presence: true
  validates :price,             presence: true
  validates :status,            presence: true
  validates :shipping_expenses, presence: true
  validates :send_from,         presence: true
  validates :lead_time,         presence: true

  #子テーブルへのバリデーション
  validates_associated :product_images
  validates :product_images, presence: true
end
