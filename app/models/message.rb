class Message
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  field :receiver_id, :type=>String
  field :sender_id, :type=>String
  field :subject, :type=>String
  field :snippet, :type=>String
  field :body, :type=>String  
  field :IsRead, :type=>Booleans, :default => 0 
end