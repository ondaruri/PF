class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :user, optional: true
  attachment :image
  validates :image, presence: true

  has_many :likes, dependent: :destroy
  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  #                                                 favorited_by?メソッドを作成。
  #                                               このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
  #                                               存在していればtrue、存在していなければfalseを返す。
  end
end
