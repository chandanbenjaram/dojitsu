class ChallengeSocialType < ChallengeType
  include Mongoid::Document
  
  field :who_win
  field :how_many_winner
  
end