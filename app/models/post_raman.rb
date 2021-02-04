class PostRaman < ApplicationRecord
    belongs_to :user
    belongs_to :shop
    has_many :post_comments, dependent: :destroy
end
