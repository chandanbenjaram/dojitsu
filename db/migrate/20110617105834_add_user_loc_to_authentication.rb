class AddUserLocToAuthentication < ActiveRecord::Migration
  def self.up
    add_column :authentications, :location_name, :string
    add_column :authentications, :location_id, :string
  end

  def self.down
    remove_column :authentications, :location_id
    remove_column :authentications, :location_name
  end
end
