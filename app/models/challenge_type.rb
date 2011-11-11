class ChallengeType
  include Mongoid::Document
  field :who_win
 
  embedded_in :challenge, :inverse_of => :social_type
  embedded_in :challenge, :inverse_of => :personal_type
  
end