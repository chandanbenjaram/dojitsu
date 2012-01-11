class Usermail
  include Mongoid::Document
  field :email, :type => String
  
  belongs_to :user_connection
end
