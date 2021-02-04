class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :post_ramens, dependent: :destroy
  has_many :clips, dependent: :destroy
  has_many :likes, dependent: :destroy
end
