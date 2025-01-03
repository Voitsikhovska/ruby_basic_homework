class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :likes, as: :likeable, dependent: :destroy

  validates :content, presence: true, length: { maximum: 280 }
end
