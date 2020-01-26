class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 購入した商品
  has_many :buyed_products, foreign_key: "buyer_id", class_name: "Product"
  # 出品中の商品
  has_many :saling_products, -> { where("buyer_id is NULL") },foreign_key: "saler_id", class_name: "Product"
  # 売却済みの商品
  has_many :sold_products, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Product"

  has_many :comments
  has_many :products, through: :comments
end
