class RemoveImageFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :image, :string
    add_column :users, :avatar, :string
  end
end
