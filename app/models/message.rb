class Message
  include Mongoid::Document
  field :to, :type=>String
  field :from, :type=>String
  field :sent_on, :type=>Date  
  field :subject, :type=>String
  field :snippet, :type=>String
  field :body, :type=>String  
end