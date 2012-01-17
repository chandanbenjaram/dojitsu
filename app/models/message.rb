class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :to, :type=>String
  field :from, :type=>String
  field :subject, :type=>String
  field :snippet, :type=>String
  field :body, :type=>String
  #field :fromUserId 
  #field :toUserId
  #field :subject
  #field :body
  #field :isRead
  #field :isFacebook # facebook OR non-facebook
  #field :messageType #sent/recive
end


