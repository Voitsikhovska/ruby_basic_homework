class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  has_many :likes, dependent: :destroy
end