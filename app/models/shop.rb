class Shop < ApplicationRecord
  has_many :post_ramens, dependent: :destroy
  accepts_nested_attributes_for :post_ramen
  attachment :image
end
