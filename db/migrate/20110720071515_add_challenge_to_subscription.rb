class AddChallengeToSubscription < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :challenge_id, :integer
  end

  def self.down
    remove_column :subscriptions, :challenge_id
  end
end
