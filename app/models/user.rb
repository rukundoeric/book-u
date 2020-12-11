class User < ApplicationRecord
  has_many :opinions, class_name: 'Opinion', foreign_key: 'author_id'
  has_many :notifications

  has_many :follower_recs, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followed_recs, class_name: 'Following', foreign_key: 'followed_id'

  has_many :followings, through: :follower_recs, source: :followed
  has_many :followers, through: :followed_recs, source: :follower

  has_attached_file :photo
  has_attached_file :cover

  validates :fullname, :username, presence: true, length: { minimum: 3 }
  validates :photo, presence: true
  validates :username, uniqueness: true
  validates_attachment_content_type :photo, content_type: ['image/jpg', 'image/jpeg', 'image/png'], presence: true
  validates_attachment_content_type :cover, content_type: ['image/jpg', 'image/jpeg', 'image/png'], presence: true

  scope :ordered_by_most_recent, -> { order(created_at: :desc) }

  def following?(user)
    followings.include?(user)
  end
end
