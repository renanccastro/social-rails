class AddProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :picture_url, :string
    add_column :users, :email, :string
  end
end
