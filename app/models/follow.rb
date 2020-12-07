class Follow < ApplicationRecord
  validates :user_id, :follow_id, presence: true
end
