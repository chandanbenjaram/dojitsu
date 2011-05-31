# == Schema Information
# Schema version: 20110515043950
#
# Table name: users
#
#  id       :integer(4)      not null, primary key
#  fname    :string(255)     not null
#  lname    :string(255)     not null
#  emailid  :string(255)     not null
#  password :string(255)     not null
#

class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :challenges, :through => :subscriptions

  attr_accessible :fname, :lname, :emailid, :password

  regex_emailid = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :fname, :presence => true  
  validates :lname, :presence => true
  validates :emailid, :presence => true, :format => {:with => regex_emailid}, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true
end
