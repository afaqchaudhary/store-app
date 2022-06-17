class Product < ApplicationRecord
  belongs_to :category
  has_many :carts

  has_one_attached :avatar

end
