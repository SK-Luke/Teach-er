class AddDetailsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :location, :string
    add_column :users, :description, :text
    add_column :users, :role, :string
    add_column :users, :contact_number, :string
  end
end
