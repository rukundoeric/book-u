class User < ApplicationRecord
  validates :name, :username, presence: true, length: { minimum: 3 }
end
