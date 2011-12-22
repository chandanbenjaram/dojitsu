class ChallengePersonalType < ChallengeType
  include Mongoid::Document  
  embedded_in :challenge, :inverse_of => :personal_type
  
end