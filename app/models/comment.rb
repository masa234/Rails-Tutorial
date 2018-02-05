class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost

  validates :user_id, presence: true
  validates :message, presence: true, length: {maximum: 140}
  default_scope -> { order(created_at: :desc)}
end


