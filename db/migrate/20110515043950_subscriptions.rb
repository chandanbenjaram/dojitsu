class Subscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |s|
      s.column :rating, :string, :null => true
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
