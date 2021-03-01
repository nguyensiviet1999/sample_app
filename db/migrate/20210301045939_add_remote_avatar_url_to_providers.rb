class AddRemoteAvatarUrlToProviders < ActiveRecord::Migration[6.0]
  def change
    add_column :providers, :avatar_url, :string
  end
end
