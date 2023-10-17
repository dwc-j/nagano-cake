class OrderDetail < ApplicationRecord
  # バリデーション
  validates :quantity, presence: true
  validates :price, presence: true

  # アソシエーション
  belongs_to :order
  belongs_to :product
end
