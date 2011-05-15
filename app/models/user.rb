class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :challenges, :through => :subscriptions
  validates_presence_of :firstname
  validates_presence_of :lastname
  validates_presence_of :emailid
end
