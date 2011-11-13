class ChallengeSocialType < ChallengeType
  include Mongoid::Document
  
  field :how_many_winners

  # challenge invitations ONLY FOR MOTHER CHALLENGE
  # every NON-MOTHER challenge should ignore this filed
  # has_many :challenge_invitations 
  
  # status can take 3 arguments, ACCEPTED, DECLINED, PENDING
  field :status, :type =>Integer, :default => -1
  
end