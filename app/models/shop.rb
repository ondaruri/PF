class Shop < ApplicationRecord
  has_many :post_ramens, dependent: :destroy
end
