class AddUserToAuthentication < ActiveRecord::Migration
  def self.up
    add_column :authentications, :user_id, :integer, :null => false
  end

  def self.down
    remove_column :authentications, :user_id
  end
end
