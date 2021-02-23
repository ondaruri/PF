class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  attachment :image
  validates :image, presence: true
  validates :title, length: {maximum: 20}
  validates :content, length: {maximum: 100}

  has_many :likes, dependent: :destroy

  geocoded_by :address                            #geocoder使用のための記載 addressカラムを基準に経緯度を算出
  after_validation :geocode                       #住所変更時に経緯度も変更

  acts_as_taggable

  def liked_by?(user)
    likes.where(user_id: user.id).exists?         #liked_by?メソッドを作成。
  end                                             #このメソッドで、引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
                                                  #存在していればtrue、存在していなければfalseを返す。
  def self.create_all_ranks
    PostRamen.find(Like.group(:post_ramen_id).order('count(post_ramen_id) desc').limit(3).pluck(:post_ramen_id))
  end

  def self.create_month_ranks
    now = Time.current
    PostRamen.joins(:likes).where(likes: { created_at: now.beginning_of_month..now.end_of_month}).group(:id).order("count(post_ramen_id) desc").limit(3)
  end

  def self.create_year_ranks
    now = Time.current
    PostRamen.joins(:likes).where(likes: { created_at: now.beginning_of_year..now.end_of_year }).group(:id).order("count(post_ramen_id) desc").limit(3)
  end

  # def self.create_tag_ranks
  #   PostRamen.joins(:likes).tagged_with("とんこつ").where(likes: { created_at: now.beginning_of_week..now.end_of_week}).group(:id).order("count(post_ramen_id) desc").limit(3)
  # end

  # def self.favorited_user(user)
  #   ramens = PostRamen.all　#全ての投稿を取得
  #   users = User.all
  #   users.each do |user|
  #     ramens_by_user = ramens.where(user_id: user.id)　#全投稿のuser.idを取得
  #     ids = ramens_by_user.pluck(:id)　#該当user の投稿を取得
  #     likes_by_user = Like.where(post_ramen_id: ids) #Like table で　Likeされた該当ユーザーの投稿を探す
  #     likes_by_user.length = likes_count # 該当userのいいね数
  #   end
  #     .order('count(likes_count) desc').limit(3).

  # end

end


# # memo
# ramens = PostRamen.all
# # user_id:1の投稿を抽出
# ramens_by_user1 = ramens.where(user_id: 1)

# ramens_by_user1 = [{PostRame_id: 1...},{XXX}....{XXX}]
# ids = ramens_by_user1.pluck(:id) => [18, 19, 20, ....]
# likes_by_user = Like.where(user_id: 1)
# likes = likes_by_user.where(post_ramen_id: ids)
# likes.length = > user_id:1のいいね数

# # 上からいいねされている記事だけ取り出したい
# # rames_by_user1のdataからpostのidを見つける
# # Favorite tableから上のidに該当するものだけ見つける

# # user1が投稿した記事のID一覧
# ids = [18, 19, 20, 24, 26, 27, 28, 29]
# =>　いいねされてる　&　されてないを含む

# # user1以外がいいねしたもの
# like_not_by_user1 = Like.wher.not(user_id: 1)

# # user1がいいねされた記事の一覧
# posts = like_not_by_user1.where(post_tramen_id: ids)


# # インスタンス
# ramen_1 = PostRamen.new

# # クラスメソッド
# PostRamen.メソッド

# # インスタンスメソッド
# ramen_1.メソッド
# PostRamen.each do |ramen|
#   ramen.liked_by?(user_id)
# end

# PostRamen.liked_by(user_id)

# # user1がいいねされた記事の一覧の数
# posts.length
