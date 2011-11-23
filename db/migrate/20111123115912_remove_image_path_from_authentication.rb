class RemoveImagePathFromAuthentication < ActiveRecord::Migration
  def up
    remove_column :authentications, :image_path
  end

  def down
    add_column :authentications, :image_path, :string
  end
end
