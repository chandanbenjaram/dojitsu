class AddUidToAuthentication < ActiveRecord::Migration
  def self.up
    add_column :authentications, :uid, :string
  end

  def self.down
    remove_column :authentications, :uid
  end
end
