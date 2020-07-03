class Order < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :status, presence: true
end
