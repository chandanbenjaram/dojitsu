# == Schema Information
# Schema version: 20110515043950
#
# Table name: subscriptions
#
#  id     :integer(4)      not null, primary key
#  rating :string(255)
#

class Subscription
  include Mongoid::Document
  include Mongoid::Timestamps

  field :rating, type: String

  belongs_to :user
end
