class CartItem < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :user
  belongs_to :product
end
