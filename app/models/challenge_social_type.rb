class ChallengeSocialType < ChallengeType
  include Mongoid::Document
  
  field :how_many_winners

  # challenge invitations ONLY FOR MEOTHER CHALLENGE
  # every NON-MOTHER challenge should ignore this filed
  #has_many :invitations
end