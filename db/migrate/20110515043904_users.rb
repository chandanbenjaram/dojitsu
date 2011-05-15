class Users < ActiveRecord::Migration
  def self.up
    create_table :users do |u|
      u.column :fname, :string, :null => false
      u.column :lname, :string, :null => false      
      u.column :emailid, :string, :null => false            
      u.column :password, :string, :null => false                  
    end
  end

  def self.down
    drop_table :users
  end
end
