class UserConnection < ActiveRecord::Base
  belongs_to :user
  has_one :usermail
end
