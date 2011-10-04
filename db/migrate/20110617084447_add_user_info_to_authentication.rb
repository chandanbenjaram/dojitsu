class AddUserInfoToAuthentication < ActiveRecord::Migration
  def self.up
    add_column :authentications, :first_name, :string
    add_column :authentications, :last_name, :string
    add_column :authentications, :name, :string
    add_column :authentications, :image_path, :string
  end

  def self.down
    remove_column :authentications, :image_path
    remove_column :authentications, :name
    remove_column :authentications, :last_name
    remove_column :authentications, :first_name
  end
end
