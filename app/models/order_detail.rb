class OrderDetail < ApplicationRecord
  after_update :update_order_status, if: :saved_change_to_making_status?
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

 private

 def update_order_status
  if self.making_status == "making"
   self.order.update(status: "is_making")
  elsif self.order.order_details.all? { |detail| detail.making_status == "completed" }
   self.order.update(status: "preparation_for_shipping")
  end
 end
end
