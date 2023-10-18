class CartItem < ApplicationRecord
  # バリデーション
  validates :amount, presence: true

  # アソシエーション
  belongs_to :user
  belongs_to :product
end
