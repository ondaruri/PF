class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :shop
  attachment :image
end
