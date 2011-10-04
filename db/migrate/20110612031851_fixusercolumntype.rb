class Fixusercolumntype < ActiveRecord::Migration
  def self.up
    change_column :users, :fname, :string, :null => true
    change_column :users, :lname, :string, :null => true
  end

  def self.down
  end
end
