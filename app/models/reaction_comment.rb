class ReactionComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :emoji
  validates :user_id, presence: true
  validates :comment_id, presence: true
  validates :emoji_id, presence: true
end
