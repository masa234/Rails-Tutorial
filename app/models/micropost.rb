class Micropost < ApplicationRecord
  before_save { self.in_reply_to = reply_user.to_s }
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  default_scope -> { order(created_at: :desc)}
  
  has_many :comments, dependent: :destroy
  has_many :comment_users, through: :comments, source: :user
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  
  
  def reply_user
    if nickname = content.match(/(@[^\s]+)\s.*/)
      nickname[1]
    end
  end
  
  scope :including_replies, ->(user){where("in_reply_to = ? OR in_reply_to = ? OR user_id = ?", "", "@#{user.nickname}", user.id)}
  
  def like_user?(user)
    like_users.include?(user)
  end
end
