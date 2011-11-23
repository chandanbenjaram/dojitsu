class RemoveLocationNameFromAuthentication < ActiveRecord::Migration
  def up
    remove_column :authentications, :location_name
  end

  def down
    add_column :authentications, :location_name, :string
  end
end
