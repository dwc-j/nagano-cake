class OrderDetail < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :order
  belongs_to :product
end
