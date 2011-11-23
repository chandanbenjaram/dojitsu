class FixUserColumnName < ActiveRecord::Migration
  def up
    def change
        change_table :users do |t|
          t.rename :fname, :first_name
          t.rename :lname, :last_name
        end
      end
  end

  def down
  end
end
