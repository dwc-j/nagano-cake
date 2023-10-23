class Order < ApplicationRecord
  # バリデーション
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_one_attached :image

  enum status: {
     "入金待ち":0,
     "入金確認":1,
     "製作中":2,
     "発送準備中":3,
     "発送済み":4
  }
  enum payment_method: ["クレジットカード", "銀行振込"]

  def add_tax_price
    (self.price * 1.10).round
  end

end
