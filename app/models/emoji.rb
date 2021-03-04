class Emoji < ApplicationRecord
  validates :emoji_image, presence: true
end
