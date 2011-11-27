class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :users, :fname, :first_name
    rename_column :users, :lname, :last_name    
  end

  def down
  end
end
