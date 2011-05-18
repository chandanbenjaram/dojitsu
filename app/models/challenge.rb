# == Schema Information
# Schema version: 20110515043950
#
# Table name: challenges
#
#  id    :integer(4)      not null, primary key
#  title :string(255)     not null
#

class Challenge < ActiveRecord::Base   
  has_many :subscriptions
  has_many :users, :through => :subscriptions
  validates_presence_of :title, :message => "title required", :null => false
end
