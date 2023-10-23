class OrderDetail < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :order
  belongs_to :item
<<<<<<< HEAD
  
  def add_tax_price
    (self.price * 1.10).round
  end
  
=======
>>>>>>> d711eb09019d45315f395be582025ea97776107d
end
