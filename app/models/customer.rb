class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

# , :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :email, presence: true, format: { with: /\A[a-zA-Z0-9]{1,}[@][a-zA-Z0-9]{1,}[.][a-zA-Z0-9]{1,}\z/ }, uniqueness: true
  validates :postal_code,length: {is: 7}, numericality: { only_integer: true}
  validates :address, presence: true
  validates :telephone_number, length: {in: 10..11}, numericality: { only_integer: true}, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 50 }, on: :create

  has_many :cart_items, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
end
