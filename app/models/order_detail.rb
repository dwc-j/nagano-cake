class OrderDetail < ApplicationRecord
  # バリデーション

  # アソシエーション
  belongs_to :order
  belongs_to :item

  def add_tax_price
    (self.price * 1.10).round
  end
  
  enum making_status: {
     "着手不可":0,
     "製作待ち":1,
     "製作中":2,
     "製作完了":3,
  }
end
