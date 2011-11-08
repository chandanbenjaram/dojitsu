class ChallengeInvitation
  include Mongoid::Document

  # status can take 3 arguments, ACCEPTED, DECLINED, PENDING
  field :status
  
  # holds invitor email id. 
  # mostly useful on chained challenges
  field :invitor_email
    
  # holds an invitee email address(required), unique on platform
  # reads something like who is invited
  field :invitee_email
  field :invitee_first_name
  field :invitee_last_name    
  
  # may be store mongo _id
  field :invitee_challenge_id
  
  belongs_to :challenge_social_type, :inverse_of => :invitations
end