class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :user, optional: true
  attachment :image
  validates :image, presence: true

  has_many :likes, dependent: :destroy

  geocoded_by :address                            #geocoder使用のための記載 addressカラムを基準に経緯度を算出
  after_validation :geocode                       #住所変更時に経緯度も変更


  def liked_by?(user)
    likes.where(user_id: user.id).exists?         #liked_by?メソッドを作成。
  end                                             #このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
                                                  #存在していればtrue、存在していなければfalseを返す。
end
