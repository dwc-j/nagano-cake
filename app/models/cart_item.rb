class CartItem < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :customer
  belongs_to :item
  has_one_attached :image
end
