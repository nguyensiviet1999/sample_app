class CreateReactionComment < ActiveRecord::Migration[6.0]
  def change
    create_table :reaction_comments do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :emoji, null: false, foreign_key: true
    end
  end
end
