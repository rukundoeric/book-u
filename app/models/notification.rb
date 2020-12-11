class Notification < ApplicationRecord
  belongs_to :user
  enum status: { created: 0, read: 1 }

  validates :title, :content, presence: true
end
