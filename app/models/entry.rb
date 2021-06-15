class Entry < ApplicationRecord
  belongs_to :user
  belongs_to :room
# ユーザーの情報とルームはレコードごとに被ることはないように一意の制約
  validates :room_id, uniqueness: { scope: :user_id }
end
