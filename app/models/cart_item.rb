class CartItem < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :customer
  belongs_to :product
  has_one_attached :image
end
