class ChallengeSocialType < ChallengeType
  include Mongoid::Document

  embedded_in :challenge, :inverse_of => :social_type
  embeds_one :trophy, as: :trophy
  
  validates_presence_of :how_many_winners
    
  field :how_many_winners
  
  # status can take 3 arguments, ACCEPTED, DECLINED, PENDING
  field :status, :type => Integer  
  
end
