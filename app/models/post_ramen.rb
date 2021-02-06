class PostRamen < ApplicationRecord
  belongs_to :shop
  attachment :image
end
