class Invitee
  include Mongoid::Document
  
  # holds an invitee email address(required), unique on platform
  # reads something like who is invited
  field :invitee_email
  field :invitee_first_name
  field :invitee_last_name    
  # status can take 3 arguments, ACCEPTED, DECLINED, PENDING
  field :status
  
  embeds_one :challenge
  embedded_in :challenge_invitation, :inverse_of => :invitees
end