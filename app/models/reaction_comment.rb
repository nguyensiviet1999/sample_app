class ReactionComment < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  belongs_to :emoji
end
