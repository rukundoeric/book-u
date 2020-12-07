class Post < ApplicationRecord
  validates :content, presence: true, length: { minimum: 3 }

  belongs_to :user
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
