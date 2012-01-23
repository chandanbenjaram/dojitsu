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
  field :isDeleted, :default =>0
  #field :isFacebook # facebook OR non-facebook
  #field :messageType #sent/recive
  
  #HELPER METHODS
  def self.iAllMessage(iID,cId)
    #Message.all(conditions: { :from => iID, :isDeleted => 0, :to => cId}).desc("created_at")    
    Message.any_in(from:[iID,cId], to:[iID,cId]).desc("created_at")
  end
    
end


