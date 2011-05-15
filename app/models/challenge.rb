class Challenge < ActiveRecord::Base   
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  validates_presence_of :title, :message => "title required", :null => false
end