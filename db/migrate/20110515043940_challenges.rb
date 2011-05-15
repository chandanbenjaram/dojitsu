class Challenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |c|
      c.column :title, :string, :null => false
    end
    Challenge.create :title => "Sample Challenge: 0"
    Challenge.create :title => "Sample Challenge: 1"
    Challenge.create :title => "Sample Challenge: 2"
  end

  def self.down
    drop_tables :challenges
  end
end
