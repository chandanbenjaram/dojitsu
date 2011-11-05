class ChallengePersonalType < ChallengeType
  include Mongoid::Document
  
  field :who_win
end