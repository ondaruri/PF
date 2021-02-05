class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  attachment :image
end
