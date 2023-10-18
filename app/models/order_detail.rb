class OrderDetail < ApplicationRecord
  # バリデーション
  validates :amount, presence: true
  validates :price, presence: true
  validates :making_status, presence: true

  # アソシエーション
  belongs_to :order
  belongs_to :product
end
