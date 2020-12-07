class Post < ApplicationRecord
  validates :content, presence: true, length: { minimum: 3 }
end
