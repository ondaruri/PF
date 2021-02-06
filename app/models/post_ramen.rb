class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  has_one :shop, dependent: :destroy #投稿時のアソシエーション
  belongs_to :shop
  # belongs_to :shop
  attachment :image
  accepts_nested_attributes_for :shop
  accepts_attachments_for :image, attachment: :image
end
