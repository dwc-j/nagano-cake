class OrderDetail < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :order
  belongs_to :item
  
  def add_tax_price
    (self.price * 1.10).round
  end

end
