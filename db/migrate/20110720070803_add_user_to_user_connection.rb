class AddUserToUserConnection < ActiveRecord::Migration
  def self.up
    add_column :user_connections, :user_id, :integer
  end

  def self.down
    remove_column :user_connections, :user_id
  end
end
