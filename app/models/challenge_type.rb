class ChallengeType
  include Mongoid::Document
  field :who_win
  validates_presence_of :who_win
end