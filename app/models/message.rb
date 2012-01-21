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
  field :isRead ,:default => 0
  #field :isFacebook # facebook OR non-facebook
  #field :messageType #sent/recive
  
  #HELPER METHODS
  def self.iAllMessage(iID)
    Message.all(conditions: { :from => iID}).desc("created_at")
  end
  
end


