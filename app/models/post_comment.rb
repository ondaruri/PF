class PostComment < ApplicationRecord
  belongs_to :post_ramen
  belongs_to :user
end
