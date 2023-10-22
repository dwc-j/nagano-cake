class CartItem < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :customer
  belongs_to :item
  has_one_attached :image

  def add_tax_price
    (self.price * 1.10).round
  end
end
