class Item < ApplicationRecord
  # バリデーション
  validates :image, presence: true
  validates :name, presence: true
  validates :explanation, presence: true
  validates :price, presence: true
  

  # アソシエーション
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_one_attached :image

  def add_tax_price
    (self.price * 1.10).round
  end


end
