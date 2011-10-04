class RemoveNameFromAuthentication < ActiveRecord::Migration
  def self.up
    remove_column :authentications, :name
  end

  def self.down
    add_column :authentications, :name, :string
  end
end
