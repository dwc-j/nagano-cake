class OrderDetail < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :order
  belongs_to :item

  def add_tax_price
    (self.price * 1.10).round
  end
  
    enum making_status: {
     "unable": 0,
     "waiting": 1,
     "making": 2,
     "completed": 3,
  }
  
end
