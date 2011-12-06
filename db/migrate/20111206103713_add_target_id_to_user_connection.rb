class AddTargetIdToUserConnection < ActiveRecord::Migration
  def self.up
    add_column :user_connections, :target_id, :string, :null => false
  end                                                                

  def self.down
    remove_column :user_connections, :target_id
  end
end
