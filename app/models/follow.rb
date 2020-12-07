class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User', foreign_key: 'follow_id'

  validates :user_id, :follow_id, presence: true
end
