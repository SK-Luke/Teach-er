class AddAvatarToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :seed_avatar, :string
  end
end
