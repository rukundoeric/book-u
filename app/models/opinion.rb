class Opinion < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  validates :text, presence: true, length: { minimum: 3 }

  scope :eager_loading, -> { includes(:author) }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
end
