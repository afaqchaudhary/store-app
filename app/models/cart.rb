class Cart < ApplicationRecord
  belongs_to :product
  has_one_attached :avatar
end
