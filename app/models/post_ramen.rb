class PostRamen < ApplicationRecord
  has_many :post_comments, dependent: :destroy
  belongs_to :user
  attachment :image
  validates :image, presence: true
  validates :title, length: {maximum: 20}
  validates :content, length: {maximum: 100}

  has_many :likes, dependent: :destroy
  has_many :image_tags, dependent: :destroy
  has_many :notifications, dependent: :destroy

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

  def create_notification_like!(current_user)
    # すでに「いいね」されているか検索
    temp = Notification.where(["visitor_id = ? and visited_id = ? and post_ramen_id = ? and action = ?", current_user.id, user_id, id, 'like'])
    # いいねされていない場合のみ通知レコードの作成
    if temp.blank?
      notification = current_user.active_notifications.new(
        post_ramen_id: id,
        visited_id: user_id,
        action: 'like')
      # 自分の投稿に対するいいねの場合は通知済みとする
      if
        notification.visitor_id == notification.visited_id
        notification.checked = true
      end
      notification.save if notification.valid?
    end
  end

  def
    create_notification_post_comment!(current_user, post_comment_id)
    # 自分以外にコメントしている人を全て取得し、全員に通知を送る
    temp_ids = PostComment.select(:user_id).where(post_ramen_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_post_comment!(current_user, post_comment_id, temp_id['user_id'])
    end
    # まだ誰もコメントしていない場合は、投稿者に通知を送る
    save_notification_post_comment!(current_user, post_comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_post_comment!(current_user, post_comment_id, visited_id)
    # コメントは複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      post_ramen_id: id,
      post_comment_id: post_comment_id,
      visited_id: visited_id,
      action: 'comment')
    # 自分の投稿に対するコメントの場合は通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


end