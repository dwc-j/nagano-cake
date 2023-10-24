class Order < ApplicationRecord
  # バリデーション
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_one_attached :image

    enum status: {
    "waiting_for_payment":0,
    "payment_confirmation":1,
    "is_making":2,
    "preparation_for_shipping":3,
    "already_shipped":4
  }

  enum payment_method: ["クレジットカード", "銀行振込"]
  # enum payment_method: { credit_card: 0, transfer: 1 }

  def add_tax_price
    (self.price * 1.10).round
  end

end
