class Address < ApplicationRecord
   # バリデーション
  validates :postal_code, presence: true
  validates :address, presence: true

  # アソシエーション
  belongs_to :user
end
