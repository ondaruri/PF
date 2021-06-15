class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :post_ramens, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages
  has_many :entries
  has_many :rooms, through: :entries
  attachment :image

  has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy #フォロー取得
  has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy #フォロワー取得

  has_many :following_user, through: :follower, source: :followed # 自分がフォローしている人
  has_many :follower_user, through: :followed, source: :follower # 自分をフォローしている人


def self.guest
  find_or_create_by(email: 'guest@guest') do |user|
    user.password = SecureRandom.urlsafe_base64
  end
end

def self.search(search) #self.でクラスメソッドとしている
    if search
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all #全て表示。
    end
end

  # ユーザーをフォローする
def follow(user_id)
   follower.create(followed_id: user_id)
end

# ユーザーのフォローを外す
def unfollow(user_id)
  follower.find_by(followed_id: user_id).destroy
end

# フォローしていればtrueを返す
def following?(user)
  following_user.include?(user)
end


end
