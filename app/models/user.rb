class User < ApplicationRecord
  has_many :posts

  has_many :follows_user, class_name: 'Follow', foreign_key: 'user_id'
  has_many :followings, through: :follows_user, source: :follow

  has_many :follows_follow, class_name: 'Follow', foreign_key: 'follow_id'
  has_many :followers, through: :follows_follow, source: :user

  validates :name, :username, presence: true, length: { minimum: 3 }
  validates :username, uniqueness: true
end
