class CreateEmojis < ActiveRecord::Migration[6.0]
  def change
    create_table :emojis do |t|
      t.string :emoji_image
    end
  end
end
