class UserProfile < ApplicationRecord
  belongs_to :user

  validates :bio, length: { maximum: 500 }
  validates :location, length: { maximum: 100 }
end
