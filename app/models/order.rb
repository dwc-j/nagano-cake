class Order < ApplicationRecord
  # バリデーション
  validates :postal_code, length: {is: 7}, numericality: { only_integer: true}
  validates :address, presence: true
  validates :name, presence: true

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_one_attached :image


    enum status: {
    "waiting_for_payment": 0,
    "payment_confirmation": 1,
    "is_making": 2,
    "preparation_for_shipping": 3,
    "already_shipped": 4
  }

  enum payment_method: { credit_card: 0, transfer: 1 }

  def add_tax_price
    (self.price * 1.10).round
  end

   after_update :update_order_details_status, if: :saved_change_to_status?
  
   private
  
   def update_order_details_status
    if self.status == "payment_confirmation"
     self.order_details.update_all(making_status: "waiting")
    end
   end

end
