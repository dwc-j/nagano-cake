class CartItem < ApplicationRecord
  # バリデーション
  validates :quantity, presence: true

  # アソシエーション
  belongs_to :user
  belongs_to :product
end
