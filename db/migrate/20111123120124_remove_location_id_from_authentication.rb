class RemoveLocationIdFromAuthentication < ActiveRecord::Migration
  def up
    remove_column :authentications, :location_id
  end

  def down
    add_column :authentications, :location_id, :string
  end
end
