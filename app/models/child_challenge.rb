class ChildChallenge < Challenge   
  include Mongoid::Document 
  
    include Rails.application.routes.url_helpers
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated
    field :title, :type=>String 
    
  belongs_to :challenge  

end