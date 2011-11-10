class ChallengeInvitation
  include Mongoid::Document
  
  # may be store mongo _id
  field :invitor_challenge_id
  
  embeds_many :invitees
  belongs_to :challenge_social_type, :inverse_of => :invitations
end