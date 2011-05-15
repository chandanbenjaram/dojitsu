class Subscription < ActiveRecord::Base   
  belongs_to :challenge
  belongs_to :user
end
