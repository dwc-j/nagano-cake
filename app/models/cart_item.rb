class CartItem < ApplicationRecord
  # バリデーション
  validates :customer_id, presence: true
  validates :item_id, presence: true
  validates :amount, presence: true

  # アソシエーション
  belongs_to :user
  belongs_to :product
end
