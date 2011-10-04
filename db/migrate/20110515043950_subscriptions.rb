class Subscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.column :rating, :string, :null => true 
      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
