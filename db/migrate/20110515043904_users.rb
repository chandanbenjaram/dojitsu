class Users < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.column :fname, :string, :null => false
      t.column :lname, :string, :null => false      
      t.column :email, :string, :null => false            
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable

      t.timestamps                  
    end
  end

  def self.down
    drop_table :users
  end
end
