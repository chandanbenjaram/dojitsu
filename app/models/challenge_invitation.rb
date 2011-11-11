class ChallengeInvitation
  include Mongoid::Document
  
  # may be store mongo _id
  field :invitee_challenge_id
  # holds invitor email id. 
  # mostly useful on chained challenges
  field :invitor_email
  
  embeds_many :invitees
  belongs_to :challenge_social_type, :inverse_of => :invitations
end