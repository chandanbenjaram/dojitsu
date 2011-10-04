class AddUserToSubscription < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :user_id, :integer
  end

  def self.down
    remove_column :subscriptions, :user_id
  end
end
