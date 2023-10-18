class Order < ApplicationRecord
  # バリデーション
  validates :customer_id, presence: true
  validates :total_payment, presence: true
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :shipping_fee, presence: true
  validates :status, presence: true
  validates :payment_method, presence: true

  # アソシエーション
  belongs_to :user
  has_many :order_details
end
