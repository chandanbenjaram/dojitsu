class Users < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :fname, :string, :null => false
      t.column :lname, :string, :null => false      
      t.column :emailid, :string, :null => false            
      t.timestamps                  
    end
  end

  def self.down
    drop_table :users
  end
end
