class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room
  has_many :notifications, dependent: :destroy
  # メッセージが空白の場合、保存されない
  validates :message, presence: true



end
