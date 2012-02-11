class Trophy
  include Mongoid::Document

  # polomorphic nature to support future needs like group-to-group challenges, community challenges, etc
  embedded_in :challenge_trophy, :polymorphic => true

  field :rank, :type => Integer            
  validates_presence_of :rank, :message => "Rank must be given for a Trophy."
  
end
