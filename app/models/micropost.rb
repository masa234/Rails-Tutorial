class Micropost < ApplicationRecord
  before_save { self.in_reply_to = reply_user.to_s }
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum: 140}
  default_scope -> { order(created_at: :desc)}
  
  has_many :comments, dependent: :destroy
  
  
  def reply_user
    if user_unique_name = content.match(/(@[^\s]+)\s.*/)
      user_unique_name[1]
    end
  end
end
