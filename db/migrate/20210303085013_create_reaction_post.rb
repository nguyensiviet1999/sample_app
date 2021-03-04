class CreateReactionPost < ActiveRecord::Migration[6.0]
  def change
    create_table :reaction_posts do |t|
      t.references :micropost, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :emoji, null: false, foreign_key: true
    end
  end
end
