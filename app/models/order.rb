class Order < ApplicationRecord
  # バリデーション
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :payment_method, presence: true

  # アソシエーション
  belongs_to :user
  has_many :order_details
end
