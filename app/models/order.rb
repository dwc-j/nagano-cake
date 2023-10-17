class Order < ApplicationRecord
  # バリデーション
  validates :total_price, presence: true

  # アソシエーション
  belongs_to :user
  has_many :order_details
end
