class Shop < ApplicationRecord
  has_one :post_ramen, dependent: :destroy
   accepts_nested_attributes_for :post_ramen
   accepts_attachments_for :image, attachment: :image
  # accepts_nested_attributes_for :post_ramens, attachment: :image
  # attachment :image
end
