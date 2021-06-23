class PostComment < ApplicationRecord
  belongs_to :post_ramen
  belongs_to :user
  has_many :notifications, dependent: :destroy
end
