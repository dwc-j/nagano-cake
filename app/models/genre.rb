class Genre < ApplicationRecord
  #バリデーション
  validates :name, presence: true

  # アソシエーション
  has_many :products
end
