class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :shop
  belongs_to :user, optional: true
  attachment :image
end
