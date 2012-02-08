class ChallengeSocialType < ChallengeType
  include Mongoid::Document

  embedded_in :challenge, :inverse_of => :social_type
  
  field :how_many_winners
  # status can take 3 arguments, ACCEPTED, DECLINED, PENDING
  field :status, :type => Integer
  
end