class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  belongs_to :parent_comment, class_name: "Comment", optional: true
  has_many :children_comments, class_name: "Comment", foreign_key: "parent_comment_id", dependent: :destroy
  has_many :reaction_comments
  has_many :emojis, through: :reaction_comments, source: :emoji
  default_scope -> { order(created_at: :asc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  scope :first_level, -> { where(parent_comment_id: nil) }
end
