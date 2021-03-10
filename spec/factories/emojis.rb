factory :emojis do |f|
  f.emoji_image { Faker::SlackEmoji.emoji }
end
factory :invalid_emoji do |f|
  f.emoji_image nil
end
