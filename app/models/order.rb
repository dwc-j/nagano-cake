class Order < ApplicationRecord
  # バリデーション
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  # アソシエーション
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_one_attached :image
end
