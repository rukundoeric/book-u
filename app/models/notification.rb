class Notification < ApplicationRecord
  belongs_to :user
  enum status: { created: 0, read: 1 }

  validates :title, :content, presence: true

  scope :eager_loading, -> { includes(:user) }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
