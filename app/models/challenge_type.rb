class ChallengeType
  include Mongoid::Document
  field :who_win
 
  embedded_in :challenge, :inverse_of => :social_challenge
  embedded_in :challenge, :inverse_of => :personal_challenge
  
end