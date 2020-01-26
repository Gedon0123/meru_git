class Product < ApplicationRecord
  belongs_to :saler, class_name: "User"
  # belongs_to :buyer, class_name: "User"
  # has_many :statuses
  has_many :comments
  has_many :users, through: :comments
end
