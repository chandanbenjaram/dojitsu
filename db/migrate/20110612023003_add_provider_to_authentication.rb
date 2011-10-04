class AddProviderToAuthentication < ActiveRecord::Migration
  def self.up
    add_column :authentications, :provider, :string
  end

  def self.down
    remove_column :authentications, :provider
  end
end
