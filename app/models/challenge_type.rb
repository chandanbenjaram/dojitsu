class ChallengeType
  include Mongoid::Document
  
  embedded_in :challenge, :inverse_of => :social_challenge
  embedded_in :challenge, :inverse_of => :personal_challenge
  
end