# frozen_string_literal: true

# == Schema Information
#
# Table name: tweets
#
#  id         :integer          not null, primary key
#  content    :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tweet < ApplicationRecord
  MAX_CONTENT_LENGTH = 240

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_by_users, through: :likes, source: :user

  validates :content, presence: true, length: { maximum: MAX_CONTENT_LENGTH }
end
