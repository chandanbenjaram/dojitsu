class CreateUserConnections < ActiveRecord::Migration
  def self.up
    create_table :user_connections do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :user_connections
  end
end
