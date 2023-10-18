class Item < ApplicationRecord
  # バリデーション
  validates :name, presence: true
  validates :price, presence: true

  # アソシエーション
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_one_attached :image
  
end
