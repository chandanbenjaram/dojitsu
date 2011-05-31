class AddEmailUniquenessIndex < ActiveRecord::Migration
  def self.up
    add_index :users, :emailid, :unique => true
  end

  def self.down
    remove_index :users, :emailid
  end
end
